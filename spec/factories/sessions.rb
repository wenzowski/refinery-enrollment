FactoryGirl.define do
  factory :session, :class => Refinery::Enrollment::Session do
    registration_begins_on  2.days.ago
    registration_ends_on    1.day.ago
    begins_on               1.day.from_now
    ends_on                 2.days.from_now
  end
end

FactoryGirl.define do
  factory :session_not_open_yet, :parent => :session do
    registration_begins_on  1.day.from_now
    registration_ends_on    2.days.from_now
    begins_on               3.days.from_now
    ends_on                 4.days.from_now
  end
end

FactoryGirl.define do
  factory :session_open_but_not_started, :parent => :session do
    registration_begins_on  1.day.ago
    registration_ends_on    1.day.from_now
    begins_on               2.days.from_now
    ends_on                 3.days.from_now
  end
end

FactoryGirl.define do
  factory :session_started_but_not_over, :parent => :session do
    registration_begins_on  3.days.ago
    registration_ends_on    2.days.ago
    begins_on               1.day.ago
    ends_on                 1.day.from_now
  end
end

FactoryGirl.define do
  factory :session_complete, :parent => :session do
    registration_begins_on  4.days.ago
    registration_ends_on    3.days.ago
    begins_on               2.days.ago
    ends_on                 1.day.ago
  end
end
