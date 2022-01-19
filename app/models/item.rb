class Item < ApplicationRecord
  has_many :cart_items
  belongs_to :genre
  has_many :order_items

  attachment :item_image, destroy: false
end
