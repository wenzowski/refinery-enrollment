module Refinery
  module Enrollment
    class StudentsController < ::ApplicationController

      before_filter :find_all_students
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @student in the line below:
        present(@page)
      end

      def show
        @student = Student.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @student in the line below:
        present(@page)
      end

    protected

      def find_all_students
        @students = Student.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/students").first
      end

    end
  end
end
