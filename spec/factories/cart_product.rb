FactoryBot.define do
  factory :cart_product do
    cart { create(:cart) }
    gross_price_cents { 0 }
    total_price_cents { 0 }
    product { create(:product) }
    amount { 1 }
  end
end