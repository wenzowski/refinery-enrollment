module Refinery
  module Enrollment
    class Student
      class Account
        class LineItem < ActiveRecord::Base
          belongs_to :account
          belongs_to :registration
          # has_one :offered_course, :through => :student_registration
          has_one :fee, :as => :billable, :dependent => :destroy
        end
      end
    end
  end
end
