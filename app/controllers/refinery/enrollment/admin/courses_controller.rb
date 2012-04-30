module Refinery
  module Enrollment
    module Admin
      class CoursesController < ::Refinery::AdminController

        crudify :'refinery/enrollment/course',
                :order => 'title ASC'

      end
    end
  end
end
