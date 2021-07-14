# frozen_string_literal: true

module Types
  class CartType < Types::BaseObject
    include CurrencyHelper

    description 'cart'
    field :cart_products, [Types::CartProductType], null: true
    field :gross_price, String, null: false
    field :total_price, String, null: false
    field :discount, Integer, null: false

    def gross_price
      number_to_currency(gross_price_money)
    end

    def total_price
      number_to_currency(total_price_money)
    end

    def discount
      gross_price_money.to_i - total_price_money.to_i
    end

    private

    def gross_price_money
      @gross_price_money ||=
        object.cart_products.sum(&:gross_price)
    end

    def total_price_money
      @total_price_money ||=
        object.cart_products.sum(&:total_price)
    end
  end
end
