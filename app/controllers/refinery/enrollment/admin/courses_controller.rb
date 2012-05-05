module Refinery
  module Enrollment
    module Admin
      class CoursesController < ::Refinery::AdminController

        crudify :'refinery/enrollment/course',
                :title_attribute => 'name', :xhr_paging => true

      end
    end
  end
end
