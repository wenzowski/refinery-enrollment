require 'money'

# Allow storing original value when converting to money
# http://pivotallabs.com/users/jdean/blog/articles/1709-creating-user-friendly-validation-messages-with-the-money-gem
Money.class_eval do
  attr_accessor :original_value
end

# Allow for different default currencies
iso_4217_code = 'USD'
if defined?(RefinerySetting)
  iso_4217_code = RefinerySetting.find_or_set(:iso_4217_default_currency, iso_4217_code)
end
Money.default_currency = Money::Currency.new(iso_4217_code)
