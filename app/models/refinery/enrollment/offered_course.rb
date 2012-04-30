module Refinery
  module Enrollment
    class OfferedCourse < ActiveRecord::Base
      has_many :registrations
      has_many :fees, :as => :billable
      belongs_to :session
      belongs_to :course


    end
  end
end
