# frozen_string_literal: true

module CurrencyHelper
  extend ActiveSupport::Concern
  include ActionView::Helpers::NumberHelper

  def number_to_currency(amount, options = {})
    return '' if amount.nil?

    case amount
    when Numeric
      numeric_amount = amount
      currency = options.fetch(:currency) { Money.default_currency }
    when Money
      numeric_amount = amount.to_f
      currency = amount.currency
    else
      raise ArgumentError('The amount should be either Money or Numeric type.')
    end

    options.reverse_merge!(
      unit: currency.symbol,
      precision: currency.exponent.to_i,
      delimiter: currency.delimiter,
      separator: currency.separator
    )

    super(numeric_amount, options)
  end
end
