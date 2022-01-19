class ShippingAddress < ApplicationRecord
  belongs_to :customer, optional: true

  validates :zip_code, presence: true, length: {minimum: 7, maximum: 7}
  validates :address, presence: true, uniqueness: true, length: {minimum: 6}
  validates :name, presence: true, length: {minimum: 2}

end
