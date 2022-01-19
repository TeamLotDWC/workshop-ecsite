class Item < ApplicationRecord
  has_many :cart_items
  belongs_to :genre
  has_many :order_items

  attachment :item_image, destroy: false





  def add_tax_sales_price
    (self.net_price * 1.10).round
  end
end
