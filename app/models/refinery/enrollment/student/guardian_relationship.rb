module Refinery
  module Enrollment
    class Student
      class GuardianRelationship < ActiveRecord::Base
        belongs_to :student
        belongs_to :guardian
      end
    end
  end
end
