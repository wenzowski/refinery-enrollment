require 'spec_helper'

module Refinery
  module Enrollment
    describe Guardian do
      it { should have_db_column(:id) }
      it { should have_db_column(:user_id) }
      it { should have_db_column(:name) }
      it { should have_db_column(:created_at) }
      it { should have_db_column(:updated_at) }

      it { should have_db_index(:id) }
      it { should have_db_index(:user_id) }

      it { should have_many(:guardian_relationships) }
      it { should have_many(:students).through(:guardian_relationships) }
      it { should belong_to(:user) }

      describe "validations" do
        subject do
          FactoryGirl.create(:guardian,
          :name => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:name) { should == "Refinery CMS" }
      end

    end
  end
end
