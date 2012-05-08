module Refinery
  module Enrollment
    class Address < ActiveRecord::Base
      attr_accessible :address1, :address2, :city, :state, :country, :zip

      belongs_to :addressable, :polymorphic => true

    end
  end
end
