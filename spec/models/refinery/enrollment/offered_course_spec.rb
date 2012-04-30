describe Refinery::Enrollment::OfferedCourse do
  it { should have_db_column(:id) }
  it { should have_db_column(:course_id) }
  it { should have_db_column(:session_id) }
  it { should have_db_column(:created_at) }
  it { should have_db_column(:updated_at) }

  it { should have_db_index(:id) }
  it { should have_db_index(:course_id) }
  it { should have_db_index(:session_id) }

  it { should have_many(:registrations) }
  it { should have_many(:fees) }
  it { should belong_to(:session) }
  it { should belong_to(:course) }
end
