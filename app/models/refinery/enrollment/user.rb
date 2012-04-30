module Refinery
  module Enrollment
    class User < ActiveRecord::Base
      belongs_to :user, :class_name => ::Refinery::User
      belongs_to :authenticatable, :polymorphic => true
    end
  end
end
