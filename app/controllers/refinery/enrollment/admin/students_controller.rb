module Refinery
  module Enrollment
    module Admin
      class StudentsController < ::Refinery::AdminController

        crudify :'refinery/enrollment/student',
                :title_attribute => 'name', :xhr_paging => true

      end
    end
  end
end
