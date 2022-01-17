class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.references :customer, foreign_key: true, null: false
      t.references :item, foreign_key: true, null: false
      t.integer :quantity, null: false, default: 0
      t.timestamps
      t.index [:customer_id, :item_id], unique: true
    end
  end
end
