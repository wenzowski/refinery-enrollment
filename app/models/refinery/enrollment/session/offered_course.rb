module Refinery
  module Enrollment
    class Session
      class OfferedCourse < ActiveRecord::Base
        attr_accessible :fee_attributes

        has_many :registrations, :class_name => 'Refinery::Enrollment::Student::Registration'
        has_one :fee, :as => :billable, :dependent => :destroy
        belongs_to :session
        belongs_to :course

        accepts_nested_attributes_for :fee

        before_save :build_or_copy_fee

        private

          def build_or_copy_fee
            unless fee
              build_fee
              f = fee
              f.amount = course_fee_amount
              f.save!
            end
          end

          def course_fee_amount
            course.fee.amount
          end

      end
    end
  end
end
