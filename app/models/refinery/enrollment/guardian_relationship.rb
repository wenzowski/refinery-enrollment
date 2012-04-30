module Refinery
  module Enrollment
    class GuardianRelationship < ActiveRecord::Base
      belongs_to :student
      belongs_to :guardian
    end
  end
end
