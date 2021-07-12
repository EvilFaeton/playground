class CreateCartProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_products do |t|
      t.integer :cart_id, null: false
      t.integer :gross_price, null: false
      t.integer :total_price, null: false
      t.integer :product_id, null: false
      t.integer :amount, null: false

      t.timestamps
    end

    add_index :cart_products, :cart_id
    add_index :cart_products, :product_id
  end
end
