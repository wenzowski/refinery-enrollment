module Refinery
  module Enrollment
    class Course < ActiveRecord::Base
      has_many :offered_courses
      has_many :sessions, :through => :offered_courses



    end
  end
end
