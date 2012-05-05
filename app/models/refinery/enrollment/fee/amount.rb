module Refinery
  module Enrollment
    class Fee
      module Amount
        extend ActiveSupport::Concern

        included do
          composed_of :amount, {
            :class_name   => "Money",
            :mapping      => [
              %w(cents cents),
              %w(currency currency_as_string)
            ],
            :constructor  => Proc.new{|cents, currency|
              Refinery::Enrollment::Money.new(
                cents || 0, currency || Money.default_currency
              )
            },
            :converter    => Proc.new{|value|
              if value.respond_to?(:to_money)
                value.to_money
              else
                raise(ArgumentError, "Can't convert #{value.class} to Money")
              end
            }
          }
        end

      end
    end
  end
end
