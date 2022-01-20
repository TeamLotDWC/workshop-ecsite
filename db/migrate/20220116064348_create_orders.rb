class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :customer, foreign_key: true, null: false
      t.string :name, null: false
      t.string :zip_code, null: false
      t.text :address, null: false
      t.integer :delivery_fee, null: false
      t.integer :payment_method, null: false, default: 0
      t.integer :shipping_status, null: false, default: 0
      t.timestamps
    end
  end
end
