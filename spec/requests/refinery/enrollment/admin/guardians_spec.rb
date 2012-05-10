# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Enrollment" do
    describe "Admin" do
      describe "guardians" do
        login_refinery_user

        describe "guardians list" do
          before(:each) do
            FactoryGirl.create(:guardian, :name => "UniqueTitleOne")
            FactoryGirl.create(:guardian, :name => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.enrollment_admin_guardians_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before(:each) do
            visit refinery.enrollment_admin_guardians_path

            click_link "Add new guardian"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Name", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Enrollment::Guardian.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Name can't be blank")
              Refinery::Enrollment::Guardian.count.should == 0
            end
          end

          # context "duplicate" do
          #   before(:each) { FactoryGirl.create(:guardian, :name => "UniqueTitle") }
          #
          #   it "should fail" do
          #     visit refinery.enrollment_admin_guardians_path
          #
          #     click_link "Add New Guardian"
          #
          #     fill_in "Name", :with => "UniqueTitle"
          #     click_button "Save"
          #
          #     page.should have_content("There were problems")
          #     Refinery::Enrollment::Guardian.count.should == 1
          #   end
          # end

        end

        describe "edit" do
          before(:each) { FactoryGirl.create(:guardian, :name => "A name") }

          it "should succeed" do
            visit refinery.enrollment_admin_guardians_path

            within ".actions" do
              click_link "Edit this guardian"
            end

            fill_in "Name", :with => "A different name"
            click_button "Save"

            page.should have_content("'A different name' was successfully updated.")
            page.should have_no_content("A name")
          end
        end

        describe "destroy" do
          before(:each) { FactoryGirl.create(:guardian, :name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.enrollment_admin_guardians_path

            click_link "Remove this guardian forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Enrollment::Guardian.count.should == 0
          end
        end

      end
    end
  end
end
