require 'spec_helper'

module Refinery
  module Enrollment
    describe Address do
      it { should have_db_column(:id) }
      it { should have_db_column(:addressable_id) }
      it { should have_db_column(:addressable_type) }
      it { should have_db_column(:address1) }
      it { should have_db_column(:address2) }
      it { should have_db_column(:city) }
      it { should have_db_column(:state) }
      it { should have_db_column(:country) }
      it { should have_db_column(:zip) }

      it { should have_db_index(:id) }
      it { should have_db_index([:addressable_id, :addressable_type]) }

      it { should belong_to(:addressable) }
    end
  end
end
