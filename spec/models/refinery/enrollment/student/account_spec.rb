require 'spec_helper'

module Refinery
  module Enrollment
    class Student
      describe Account do
        it { should have_db_column(:id) }
        it { should have_db_column(:student_id) }
        it { should have_db_column(:session_id) }
        it { should have_db_column(:due_date) }
        it { should have_db_column(:created_at) }
        it { should have_db_column(:updated_at) }

        it { should have_db_index(:id) }
        it { should have_db_index(:student_id) }
        it { should have_db_index(:session_id) }

        it { should belong_to(:student) }
        it { should belong_to(:session) }
        it { should have_many(:line_items) }
        it { should have_one(:fee) }
      end
    end
  end
end
