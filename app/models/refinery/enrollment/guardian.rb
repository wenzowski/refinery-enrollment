module Refinery
  module Enrollment
    class Guardian < Refinery::Core::BaseModel
      attr_accessible :user_id, :name

      has_many :guardian_relationships,
               :class_name => 'Refinery::Enrollment::Student::GuardianRelationship'
      has_many :students, :through => :guardian_relationships
      belongs_to :user, :class_name => ::Refinery::User

      acts_as_indexed :fields => [:name]

      validates :name, :presence => true

    end
  end
end
