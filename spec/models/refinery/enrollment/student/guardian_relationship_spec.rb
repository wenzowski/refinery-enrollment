require 'spec_helper'

module Refinery
  module Enrollment
    class Student
      describe GuardianRelationship do
        it { should have_db_column(:id) }
        it { should have_db_index(:student_id) }
        it { should have_db_index(:guardian_id) }
        it { should have_db_column(:created_at) }
        it { should have_db_column(:updated_at) }

        it { should have_db_index(:id) }

        it { should belong_to(:student) }
        it { should belong_to(:guardian) }
      end
    end
  end
end
