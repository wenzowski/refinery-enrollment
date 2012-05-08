# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Enrollment" do
    describe "Admin" do
      describe "sessions" do
        login_refinery_user

        describe "sessions list" do
          it "shows all items" do
            session_not_open_yet = Factory(:session_not_open_yet)
            session_open_but_not_started = Factory(:session_open_but_not_started)
            session_started_but_not_over = Factory(:session_started_but_not_over)
            session_complete = Factory(:session_complete)

            visit refinery.enrollment_admin_sessions_path

            page.should have_css("li#session_#{session_not_open_yet.id}")
            page.should have_css("li#session_#{session_open_but_not_started.id}")
            page.should have_css("li#session_#{session_started_but_not_over.id}")
            page.should have_css("li#session_#{session_complete.id}")

            Refinery::Enrollment::Session.count.should == 4
          end

        end

        describe "create" do
          before(:each) do
            visit refinery.enrollment_admin_sessions_path

            click_link "Create new session"
          end

          context "valid data" do
            it "should succeed" do
              valid = FactoryGirl.attributes_for(:session)

              select valid[:begins_on].year.to_s,
                :from => "session_begins_on_1i"
              select Date::MONTHNAMES[valid[:begins_on].month],
                :from => "session_begins_on_2i"
              select valid[:begins_on].day.to_s,
                :from => "session_begins_on_3i"

              select valid[:ends_on].year.to_s,
                :from => "session_ends_on_1i"
              select Date::MONTHNAMES[valid[:ends_on].month],
                :from => "session_ends_on_2i"
              select valid[:ends_on].day.to_s,
                :from => "session_ends_on_3i"

              select valid[:registration_begins_on].year.to_s,
                :from => "session_registration_begins_on_1i"
              select Date::MONTHNAMES[valid[:registration_begins_on].month],
                :from => "session_registration_begins_on_2i"
              select valid[:registration_begins_on].day.to_s,
                :from => "session_registration_begins_on_3i"

              select valid[:registration_ends_on].year.to_s,
                :from => "session_registration_ends_on_1i"
              select Date::MONTHNAMES[valid[:registration_ends_on].month],
                :from => "session_registration_ends_on_2i"
              select valid[:registration_ends_on].day.to_s,
                :from => "session_registration_ends_on_3i"

              click_button "Save"

              page.should have_content('was successfully added')

              Refinery::Enrollment::Session.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("There were problems with the following fields")
              page.should have_content("The session starts after it ends.")
              page.should have_content("The registration period starts after it ends.")
              page.should have_content("The registration period ends after the session.")

              Refinery::Enrollment::Session.count.should == 0
            end
          end

        end

        describe "edit" do

          it "should succeed" do
            FactoryGirl.create(:session_complete)
            valid = FactoryGirl.attributes_for(:session_not_open_yet)

            visit refinery.enrollment_admin_sessions_path

            within ".actions" do
              click_link "Edit this session"
            end

            select valid[:begins_on].year.to_s,
              :from => "session_begins_on_1i"
            select Date::MONTHNAMES[valid[:begins_on].month],
              :from => "session_begins_on_2i"
            select valid[:begins_on].day.to_s,
              :from => "session_begins_on_3i"

            select valid[:ends_on].year.to_s,
              :from => "session_ends_on_1i"
            select Date::MONTHNAMES[valid[:ends_on].month],
              :from => "session_ends_on_2i"
            select valid[:ends_on].day.to_s,
              :from => "session_ends_on_3i"

            select valid[:registration_begins_on].year.to_s,
              :from => "session_registration_begins_on_1i"
            select Date::MONTHNAMES[valid[:registration_begins_on].month],
              :from => "session_registration_begins_on_2i"
            select valid[:registration_begins_on].day.to_s,
              :from => "session_registration_begins_on_3i"

            select valid[:registration_ends_on].year.to_s,
              :from => "session_registration_ends_on_1i"
            select Date::MONTHNAMES[valid[:registration_ends_on].month],
              :from => "session_registration_ends_on_2i"
            select valid[:registration_ends_on].day.to_s,
              :from => "session_registration_ends_on_3i"

            click_button "Save"

            page.should have_content("was successfully updated.")
          end
        end

        describe "destroy" do
          before(:each) { FactoryGirl.create(:session) }

          it "should succeed" do
            visit refinery.enrollment_admin_sessions_path

            click_link "Remove this session forever"

            page.should have_content("was successfully removed.")
            Refinery::Enrollment::Session.count.should == 0
          end
        end

      end
    end
  end
end
