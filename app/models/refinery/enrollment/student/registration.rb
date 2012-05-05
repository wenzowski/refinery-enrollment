module Refinery
  module Enrollment
    class Student
      class Registration < ActiveRecord::Base
        belongs_to :offered_course
        belongs_to :student
      end
    end
  end
end
