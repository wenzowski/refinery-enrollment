module Refinery
  module Enrollment
    module Admin
      class SessionsController < ::Refinery::AdminController

        crudify :'refinery/enrollment/session', :xhr_paging => true

      end
    end
  end
end
