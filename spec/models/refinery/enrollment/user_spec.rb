describe Refinery::Enrollment::User do
  it { should have_db_column(:id) }
  it { should have_db_column(:authenticatable_id) }
  it { should have_db_column(:authenticatable_type) }
  it { should have_db_column(:created_at) }
  it { should have_db_column(:updated_at) }

  it { should have_db_index(:id) }
  it { should have_db_index(:user_id) }
  it { should have_db_index([:authenticatable_id, :authenticatable_type]) }

  it { should belong_to(:user) }
  it { should belong_to(:authenticatable) }
end
