module Refinery
  module Enrollment
    class Course < Refinery::Core::BaseModel
      attr_accessible :name, :fee_attributes

      has_many :offered_courses, :class_name => Refinery::Enrollment::Session::OfferedCourse, :dependent => :destroy
      has_many :sessions, :through => :offered_courses
      has_one :fee, :as => :billable, :dependent => :destroy

      accepts_nested_attributes_for :fee

      after_initialize do
        build_fee unless fee
      end

      acts_as_indexed :fields => [:name]

      validates :name, :presence => true, :uniqueness => true

      def title
        name
      end

      def fee_for_session(session)
        fee_from(offered_in session) || fee
      end

      def offered_in(session)
        case session
        when Refinery::Enrollment::Session
          offered_courses.where(:session_id => session[:id]).limit(1)[0]
        when NilClass
          nil
        else
          raise TypeError, "#{session.class} given instead of Refinery::Enrollment::Session"
        end
      end

      def fee_from(obj)
        obj.fee if obj.respond_to?(:fee)
      end

    end
  end
end
