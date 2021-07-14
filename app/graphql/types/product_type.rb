# frozen_string_literal: true

module Types
  class ProductType < Types::BaseObject
    include CurrencyHelper

    description 'product'
    field :id, Integer, null: false
    field :identifier, String, null: false
    field :title, String, null: true
    field :price, String, null: false
    field :discounted_price, String, null: false
    field :discount, Integer, null: false
    field :free, Boolean, null: false

    def price
      number_to_currency(object.price)
    end

    def discounted_price
      number_to_currency(discount_price)
    end

    def discount
      object.price.to_i - discount_price.to_i
    end

    def free
      discount_price.zero?
    end

    def discount_price
      @discount_price ||=
        DiscountCalculator.for_product(object, context[:cart])
    end
  end
end
