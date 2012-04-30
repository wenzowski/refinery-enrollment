module Refinery
  module Enrollment
    module Admin
      class RegistrationsController < ::Refinery::AdminController

        crudify :'refinery/enrollment/registration',
                :order => 'title ASC'

      end
    end
  end
end
