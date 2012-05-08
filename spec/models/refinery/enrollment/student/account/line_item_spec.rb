require 'spec_helper'

module Refinery
  module Enrollment
    class Student
      class Account
        describe LineItem do
          it { should have_db_column(:id) }
          it { should have_db_column(:account_id) }
          it { should have_db_column(:registration_id) }
          it { should have_db_column(:name) }
          it { should have_db_column(:created_at) }
          it { should have_db_column(:updated_at) }

          it { should have_db_index(:id) }
          it { should have_db_index(:account_id) }
          it { should have_db_index(:registration_id) }

          it { should belong_to(:account) }
          it { should belong_to(:registration) }
          it { should have_one(:fee) }
        end
      end
    end
  end
end
