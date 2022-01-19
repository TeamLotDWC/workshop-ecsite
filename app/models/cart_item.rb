class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item

  def add_item(item_id:, quantity:)
    item = CartItem.find_by(item_id: item_id) || CartItem.build(item_id: item_id)
    item.quantity += quantity.to_i
    item.save
  end


  def update_item(item_id:, quantity:)
    item = CartItem.find_by(item_id: item_id)
    item.update(quantity: quantity.to_i)
  end

  def delete_item(item_id:)
    item = CartItem.find_by(item_id: item_id)
    item.destroy
  end


  def total_price
    CartItem.sum("quantity * item.add_tax_sales_price")
  end
end
