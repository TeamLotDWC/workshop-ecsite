class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.references :genre, foreign_key: true, null: false
      t.string :name, null: false
      t.text :introduction, null: false
      t.integer :net_price, null: false
      t.string :item_image_id, null: false
      t.boolean :is_stocked, null: false
      t.timestamps
    end
  end
end
