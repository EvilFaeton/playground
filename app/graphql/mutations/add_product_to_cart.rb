# frozen_string_literal: true

module Mutations
  class AddProductToCart < BaseMutation
    argument :product_id, Integer, required: true
    field :success, Boolean, null: false

    def resolve(product_id:)
      product = Product.find(product_id)
      cart_product = find_or_init_cart_product(product_id)

      cart_product.with_lock do
        cart_product.amount += 1
        cart_product.gross_price = cart_product.amount * product.price
        cart_product.total_price = DiscountCalculator.for_cart_product(cart_product)

        cart_product.save!
      end

      { success: true }
    end

    def find_or_init_cart_product(product_id)
      context[:cart].cart_products.find_by(product_id: product_id) ||
        CartProduct.new(cart: context[:cart], product_id: product_id, amount: 0)
    end
  end
end
