# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :discount_rule

  validates :price_cents, :identifier, presence: true
  validates :identifier, uniqueness: true

  monetize :price_cents
end
