require 'rails_helper'

RSpec.describe DiscountCalculator do
  context "for product" do
    context "each_item" do
      let(:product) do
        create(:product, price_cents: 400,
               discount_rule: create(:discount_rule, discount_type: 'each_item', amount: 100, value: 2))
      end
      context "if user is eligible for discount" do
        let(:cart) { create(:cart, cart_products: [create(:cart_product, product: product, amount: 1)])}
        it "return correct price" do
          expect(described_class.for_product(product, cart).zero?).to be_truthy
        end
      end

      context "if user is not eligible for discount" do
        let(:cart) { create(:cart, cart_products: [create(:cart_product, product: product, amount: 2)])}
        it "return correct price" do
          expect(described_class.for_product(product, cart)).to be_eql(product.price)
        end
      end
    end

    context "bulk" do
      let(:product) do
        create(:product, price_cents: 400,
               discount_rule: create(:discount_rule, discount_type: 'bulk', amount: 50, value: 3))
      end
      context "if user is eligible for discount" do
        let(:cart) { create(:cart, cart_products: [create(:cart_product, product: product, amount: 2)])}
        it "return correct price" do
          expect(described_class.for_product(product, cart)).to be_eql(product.price / 2)
        end
      end

      context "if user is not eligible for discount" do
        let(:cart) { create(:cart, cart_products: [create(:cart_product, product: product, amount: 1)])}
        it "return correct price" do
          expect(described_class.for_product(product, cart)).to be_eql(product.price)
        end
      end
    end
  end
  context "for cart product" do
    context "each_item" do
      let(:product) do
        create(:product, price_cents: 400,
               discount_rule: create(:discount_rule, discount_type: 'each_item', amount: 100, value: 2))
      end
      context "if user is eligible for discount" do
        let(:cart_product) { create(:cart_product, product: product, amount: 2, gross_price: product.price * 2)}
        it "return correct price" do
          expect(described_class.for_cart_product(cart_product)).to be_eql(product.price)
        end
      end
      context "if user is not eligible for discount" do
        let(:cart_product) { create(:cart_product, product: product, amount: 1, gross_price: product.price)}
        it "return correct price" do
          expect(described_class.for_cart_product(cart_product)).to be_eql(product.price)
        end
      end
    end
    context "bulk" do
      let(:product) do
        create(:product, price_cents: 400,
               discount_rule: create(:discount_rule, discount_type: 'bulk', amount: 50, value: 3))
      end
      context "if user is eligible for discount" do
        let(:cart_product) { create(:cart_product, product: product, amount: 3, gross_price: product.price * 3)}
        it "return correct price" do
          expect(described_class.for_cart_product(cart_product)).to be_eql(product.price * 3 / 2)
        end
      end
      context "if user is not eligible for discount" do
        let(:cart_product) { create(:cart_product, product: product, amount: 1, gross_price: product.price)}
        it "return correct price" do
          expect(described_class.for_cart_product(cart_product)).to be_eql(product.price)
        end
      end
    end
  end
end