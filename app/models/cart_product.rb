# frozen_string_literal: true

class CartProduct < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  validates :gross_price_cents, :total_price_cents, :amount, :cart, :product, presence: true

  monetize :gross_price_cents
  monetize :total_price_cents
end
