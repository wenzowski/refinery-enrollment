module Refinery
  module Enrollment
    module Admin
      class SessionsController < ::Refinery::AdminController
        before_filter :all_courses, :only => [:new, :create, :edit]
        before_filter :gotcha, :only => [:update]

        crudify :'refinery/enrollment/session', :xhr_paging => true

        def all_courses
          @all_courses ||= Refinery::Enrollment::Course.all
        end

        def gotcha
          params[:session][:course_ids] ||= []
        end

      end
    end
  end
end
