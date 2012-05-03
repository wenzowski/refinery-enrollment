require 'spec_helper'

module Refinery
  module Enrollment
    describe Registration do
      it { should have_db_column(:id) }
      it { should have_db_column(:offered_course_id) }
      it { should have_db_column(:student_id) }
      it { should have_db_column(:created_at) }
      it { should have_db_column(:updated_at) }

      it { should have_db_index(:id) }
      it { should have_db_index(:offered_course_id) }
      it { should have_db_index(:student_id) }

      it { should belong_to(:offered_course) }
      it { should belong_to(:student) }
    end
  end
end
