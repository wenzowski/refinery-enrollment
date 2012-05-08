require 'spec_helper'

module Refinery
  module Enrollment
    describe Phone do
      it { should have_db_column(:id) }
      it { should have_db_column(:phoneable_id) }
      it { should have_db_column(:phoneable_type) }
      it { should have_db_column(:number) }
      it { should have_db_column(:textable) }

      it { should have_db_index(:id) }
      it { should have_db_index([:phoneable_id, :phoneable_type]) }

      it { should belong_to(:phoneable) }
    end
  end
end
