FactoryGirl.define do
  factory :student, :class => Refinery::Enrollment::Student do
    sequence(:name) { |n| "student-#{n}" }
  end
end
