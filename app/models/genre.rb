class Genre < ApplicationRecord
  has_many :items

  validate :name, presence; true
end
