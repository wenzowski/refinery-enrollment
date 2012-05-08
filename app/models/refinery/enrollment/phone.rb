module Refinery
  module Enrollment
    class Phone < ActiveRecord::Base
      attr_accessible :number

      belongs_to :phoneable, :polymorphic => true

    end
  end
end
