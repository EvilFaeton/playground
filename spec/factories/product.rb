FactoryBot.define do
  factory :product do
    identifier { "UN1" }
    title { 'Product' }
    price_cents { 400 }
    discount_rule { create(:discount_rule) }
  end
end