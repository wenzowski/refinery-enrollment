module Refinery
  module Enrollment
    class Student
      class Account < ActiveRecord::Base
        belongs_to :student
        belongs_to :session
        has_many :line_items
        has_one :fee, :as => :billable, :dependent => :destroy

        def subtotal
          fee
        end

        def tax
          fee * (tax_rate || 0)
        end

        def total
          fee + tax
        end

      end
    end
  end
end
