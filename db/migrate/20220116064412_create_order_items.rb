class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.references :order, foreign_key: true, null: false
      t.references :item, foreign_key: true, null: false
      t.integer :quantity, null: false
      t.integer :taxed_item_price_at_order, null: false
      t.integer :process_status, null: false
      t.timestamps

      t.index [:order_id, :item_id], unique: true
    end
  end
end
