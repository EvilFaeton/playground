require 'rails_helper'

RSpec.describe Mutations::AddProductToCart do
  let!(:product) { create(:product) }

  context "for new product" do
    let!(:cart) { create(:cart) }
    it "creates cart product" do
      query = <<~GQL.squish
      mutation {
        addProductToCart(input: {productId: #{product.id}}) {
          success
        }
      }
      GQL
      AppSchema.execute(query: query, context: { cart: cart })
      expect(cart.cart_products.count == 1).to be_truthy
    end
  end
  context "if cart product already exists" do
    let!(:cart) { create(:cart, cart_products: [create(:cart_product, product: product, amount: 1)]) }
    it "updates amount of cart product" do
      query = <<~GQL.squish
      mutation {
        addProductToCart(input: {productId: #{product.id}}) {
          success
        }
      }
      GQL
      AppSchema.execute(query: query, context: { cart: cart })
      expect(cart.reload.cart_products.first.amount == 2).to be_truthy      
    end
  end
end
