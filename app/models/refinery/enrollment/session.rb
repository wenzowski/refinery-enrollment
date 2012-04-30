module Refinery
  module Enrollment
    class Session < ActiveRecord::Base
      has_many :offered_courses
      has_many :courses, :through => :offered_courses
      has_many :registrations, :through => :offered_courses
      has_many :fees, :as => :billable

      validates :begins_on, :ends_on, :registration_begins_on, :registration_ends_on,
        :presence => true
      validate :that_it_ends_after_it_begins
      validate :that_registration_ends_after_it_begins
      validate :that_registration_ends_before_the_session_does

      def self.next_available
        available.limit(1)
      end

      def self.available
        where('registration_ends_on > ?', Time.zone.now)
      end

      def started?
        this_before_that?(begins_on, Time.zone.now)
      end

      def ended?
        this_before_that?(ends_on, Time.zone.now)
      end

      def registration_started?
        this_before_that?(registration_begins_on, Time.zone.now)
      end

      def registration_ended?
        this_before_that?(registration_ends_on, Time.zone.now)
      end

      def registerable?
        return true if registration_started? && !registration_ended?
        false
      end

      def registration_status
        case
        when !registration_started? && !registration_ended?
          "Session registration will open on #{registration_begins_on}."
        when registration_started? && !registration_ended?
          'Session registration is open.'
        when registration_started? && registration_ended?
          "Session registration closed on #{registration_ends_on}."
        else raise 'Session registration is broken.'
        end
      end

      private

        def this_before_that?(before, after)
          unless [before, after].map{|val| val.respond_to?(:to_date)}.include?(false)
            return true if before.to_date < after.to_date
            return false
          end
          unless before.nil? && after.nil?
            raise "I'm supposed to be comparing dates, but instead I have #{date1} and #{date2}"
          end
          true
        end

        def that_it_ends_after_it_begins
          unless this_before_that?(begins_on, ends_on)
            errors.add :base, 'The session starts after it ends.'
          end
        end

        def that_registration_ends_after_it_begins
          unless this_before_that?(registration_begins_on, registration_ends_on)
            errors.add :base, 'The registration period starts after it ends.'
          end
        end

        def that_registration_ends_before_the_session_does
          unless this_before_that?(registration_ends_on, ends_on)
            errors.add :base, 'The registration period ends after the session.'
          end
        end

    end
  end
end
