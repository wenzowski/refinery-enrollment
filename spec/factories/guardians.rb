FactoryGirl.define do
  factory :guardian, :class => Refinery::Enrollment::Guardian do
    sequence(:name) { |n| "refinery#{n}" }
  end
end
