# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.delete_all
Cart.update_all(active: false)
DiscountRule.delete_all

tea_discount = DiscountRule.create!(discount_type: 'each_item', value: 2, amount: 100)
strawberries_discount = DiscountRule.create!(discount_type: 'bulk', value: 3, amount: 10)
coffee_discount = DiscountRule.create!(discount_type: 'bulk', value: 3, amount: 33.33)

[
  { identifier: 'GR1', title: 'Green tea', price: Money.new(311), discount_rule: tea_discount },
  { identifier: 'SR1', title: 'Strawberries', price: Money.new(500), discount_rule: strawberries_discount },
  { identifier: 'CF1', title: 'Coffee', price: Money.new(1123), discount_rule: coffee_discount }
].each do |product|
  Product.create!(product)
end