module Refinery
  module Enrollment
    class Session
      class OfferedCourse < ActiveRecord::Base
        has_many :registrations, :class_name => 'Refinery::Enrollment::Student::Registration'
        has_many :fees, :as => :billable, :dependent => :destroy
        belongs_to :session
        belongs_to :course
      end
    end
  end
end
