require 'spec_helper'

module Refinery
  module Enrollment
    class Course
      describe Prerequisite do
        it { should have_db_column(:id) }
        it { should have_db_column(:type) }
        it { should have_db_column(:course_id) }

        it { should have_db_index(:id) }
        it { should have_db_index(:course_id) }

        it { should belong_to(:course) }
      end
    end
  end
end
