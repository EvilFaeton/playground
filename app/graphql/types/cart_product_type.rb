# frozen_string_literal: true

module Types
  class CartProductType < Types::BaseObject
    include CurrencyHelper

    description 'cart product'
    field :gross_price, String, null: false
    field :total_price, String, null: false
    field :discount, Integer, null: false
    field :amount, Integer, null: false
    field :product, ProductType, null: false

    def gross_price
      number_to_currency(object.gross_price)
    end

    def total_price
      number_to_currency(object.total_price)
    end

    def discount
      object.gross_price.to_i - object.total_price.to_i
    end
  end
end
