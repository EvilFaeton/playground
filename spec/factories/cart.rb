FactoryBot.define do
  factory :cart do
    active { true }
    cart_products { [] }
  end
end