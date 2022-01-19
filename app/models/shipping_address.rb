class ShippingAddress < ApplicationRecord
  belongs_to :customer, optional: true

  validates :zip_code, length: {minimum: 7, maximum: 7}
  validates :address, uniqueness: true, length: {minimum: 6}
  validates :name, length: {minimum: 2}

end
