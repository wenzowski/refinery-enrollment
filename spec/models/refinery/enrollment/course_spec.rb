require 'spec_helper'

module Refinery
  module Enrollment
    describe Course do
      it { should have_db_column(:id) }
      it { should have_db_column(:name) }
      it { should have_db_column(:created_at) }
      it { should have_db_column(:updated_at) }

      it { should have_db_index(:id) }

      it { should have_many(:offered_courses) }
      it { should have_many(:sessions).through(:offered_courses) }

      describe "validations" do
        subject do
          FactoryGirl.create(:course, :name => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:name) { should == "Refinery CMS" }
      end

    end
  end
end
