describe Refinery::Enrollment::Fee do
  it { should have_db_column(:id) }
  it { should have_db_column(:cents) }
  it { should have_db_column(:currency) }
  it { should have_db_column(:billable_id) }
  it { should have_db_column(:billable_type) }

  it { should have_db_index(:id) }
  it { should have_db_index([:billable_id, :billable_type]) }

  it { should belong_to(:billable) }

  it 'should use the Money class' do
    %w(1 '1' 1.11 '$10.11' '.1$').each do |amount|
      f = Refinery::Enrollment::Fee.new
      f.amount = amount
      f.amount.original_value.should == amount
      f.amount.should == amount.to_money
    end
  end

end
