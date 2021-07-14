# frozen_string_literal: true

class DiscountRule < ApplicationRecord
  RULES = %w[each_item bulk].freeze

  validates :discount_type, inclusion: { in: RULES }, presence: true
  validates :amount, :value, presence: true
end
