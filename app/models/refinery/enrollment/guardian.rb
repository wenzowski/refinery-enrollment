module Refinery
  module Enrollment
    class Guardian < ActiveRecord::Base
      has_many :guardian_relationships
      has_many :students, :through => :guardian_relationships
      has_one :user, :as => :authenticatable

    end
  end
end
