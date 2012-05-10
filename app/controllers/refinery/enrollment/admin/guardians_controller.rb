module Refinery
  module Enrollment
    module Admin
      class GuardiansController < ::Refinery::AdminController

        crudify :'refinery/enrollment/guardian',
                :title_attribute => 'name', :xhr_paging => true

      end
    end
  end
end
