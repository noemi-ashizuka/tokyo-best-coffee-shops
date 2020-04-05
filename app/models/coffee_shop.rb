class CoffeeShop < ApplicationRecord
  belongs_to :user
  has_many :reviews

  validates :name, :address, presence: true
end
