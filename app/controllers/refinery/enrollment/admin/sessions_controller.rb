module Refinery
  module Enrollment
    module Admin
      class SessionsController < ::Refinery::AdminController

        crudify :'refinery/enrollment/session',
                :order => 'title ASC'

      end
    end
  end
end
