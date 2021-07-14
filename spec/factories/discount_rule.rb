FactoryBot.define do
  factory :discount_rule do
    discount_type { 'each_item' }
    amount { 50 }
    value { 2 }
  end
end