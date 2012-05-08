module Refinery
  module Enrollment
    module Admin
      class CoursesController < ::Refinery::AdminController
        before_filter :all_sessions, :only => [:new, :create, :edit]

        crudify :'refinery/enrollment/course',
                :title_attribute => 'name', :xhr_paging => true

        def all_sessions
          @all_sessions ||= Refinery::Enrollment::Session.all
        end

      end
    end
  end
end
