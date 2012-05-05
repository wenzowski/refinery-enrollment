module Refinery
  module Enrollment
    class Course
      class Prerequisite < ActiveRecord::Base
        belongs_to :course, :class_name => Refinery::Enrollment::Course
      end
    end
  end
end