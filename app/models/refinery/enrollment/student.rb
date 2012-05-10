module Refinery
  module Enrollment
    class Student < Refinery::Core::BaseModel
      attr_accessible :user_id, :name

      has_many :registrations
      has_many :guardian_relationships
      has_many :guardians, :through => :guardian_relationships
      belongs_to :user, :class_name => ::Refinery::User

      acts_as_indexed :fields => [:name]

      validates :name, :presence => true

    end
  end
end
