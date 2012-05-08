module Refinery
  module Enrollment
    class Course < Refinery::Core::BaseModel
      attr_accessible :name

      has_many :offered_courses, :class_name => Refinery::Enrollment::Session::OfferedCourse
      has_many :sessions, :through => :offered_courses

      acts_as_indexed :fields => [:name]

      validates :name, :presence => true, :uniqueness => true

      # def title was created automatically because you didn't specify a string field
      # when you ran the refinery:engine generator. <3 <3 Refinery CMS.
      def title
        "Override `def title` in app/models/refinery/enrollment/session.rb"
      end

    end
  end
end
