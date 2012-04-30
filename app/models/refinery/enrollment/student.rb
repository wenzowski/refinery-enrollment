module Refinery
  module Enrollment
    class Student < ActiveRecord::Base
      has_many :registrations
      has_many :guardian_relationships
      has_many :guardians, :through => :guardian_relationships
      has_one :user, :as => :authenticatable

      validates :name, :presence => true

    end
  end
end
