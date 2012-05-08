module Refinery
  module Enrollment
    module Admin
      class SessionsController < ::Refinery::AdminController
        before_filter :all_courses, :only => [:new, :create, :edit]

        crudify :'refinery/enrollment/session', :xhr_paging => true

        def all_courses
          @all_courses ||= Refinery::Enrollment::Course.all
        end

      end
    end
  end
end
