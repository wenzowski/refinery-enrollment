describe Refinery::Enrollment::Guardian do
  it { should have_db_column(:id) }
  it { should have_db_column(:name) }
  it { should have_db_column(:created_at) }
  it { should have_db_column(:updated_at) }

  it { should have_db_index(:id) }

  it { should have_many(:guardian_relationships) }
  it { should have_many(:students).through(:guardian_relationships) }
  it { should have_one(:user) }
end
