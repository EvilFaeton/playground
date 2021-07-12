class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :identifier, null: false
      t.string :title
      t.integer :price, null: false
      t.integer :discount_rule_id

      t.timestamps
    end
    
    add_index :products, :discount_rule_id
    add_index :products, :identifier, unique: true
  end
end
