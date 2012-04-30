module Refinery
  module Enrollment
    class Fee < ActiveRecord::Base
      include Refinery::Enrollment::Fee::Amount
      attr_accessible :amount

      belongs_to :billable, :polymorphic => true

    end
  end
end
