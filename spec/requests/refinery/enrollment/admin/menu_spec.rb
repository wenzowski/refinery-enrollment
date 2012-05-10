require 'spec_helper'

describe "Enrollment menu entry" do
  login_refinery_user

  it "is highlighted when managing enrollment" do
    visit refinery.admin_root_path

    within("nav#menu") { click_link "Enrollment" }

    page.should have_css("a.active", :text => "Enrollment")
  end

  context "enrollment actions" do

    it "should be presented" do
      visit refinery.enrollment_admin_root_path
      page.should have_selector("nav#actions")
    end

    it "should have a courses section" do
      visit refinery.enrollment_admin_courses_path

      page.should have_selector("nav#actions")
      page.should have_content("Courses")
      page.should have_content("Manage courses")
      page.should have_content("Create new course")
    end

    it "should have a sessions section" do
      visit refinery.enrollment_admin_sessions_path

      page.should have_selector("nav#actions")
      page.should have_content("Sessions")
      page.should have_content("Manage sessions")
      page.should have_content("Create new session")
    end

    it "should have a settings section" do
      visit refinery.enrollment_admin_root_path

      page.should have_selector("nav#actions")
      page.should have_content("Settings")
      page.should have_content("Update who gets notified")
    end

    it "should have a students section" do
      visit refinery.enrollment_admin_root_path

      page.should have_selector("nav#actions")
      page.should have_content("Students")
      page.should have_content("Manage students")
      page.should have_content("Create new student")
    end

    it "should have a guardians section" do
      visit refinery.enrollment_admin_root_path

      page.should have_selector("nav#actions")
      page.should have_content("Guardians")
      page.should have_content("Manage guardians")
      page.should have_content("Create new guardian")
    end

  end

end
