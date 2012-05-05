FactoryGirl.define do
  factory :course, :class => Refinery::Enrollment::Course do
    sequence(:name) { |n| "refinery#{n}" }
  end
end
