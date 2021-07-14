class CreateDiscountRules < ActiveRecord::Migration[6.1]
  def change
    create_table :discount_rules do |t|
      t.string :discount_type, null: false
      t.float :amount, null: false
      t.integer :value, null: false

      t.timestamps
    end
  end
end
