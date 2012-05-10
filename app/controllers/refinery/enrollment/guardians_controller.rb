module Refinery
  module Enrollment
    class GuardiansController < ::ApplicationController

      before_filter :find_all_guardians
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @guardian in the line below:
        present(@page)
      end

      def show
        @guardian = Guardian.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @guardian in the line below:
        present(@page)
      end

    protected

      def find_all_guardians
        @guardians = Guardian.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/guardians").first
      end

    end
  end
end
