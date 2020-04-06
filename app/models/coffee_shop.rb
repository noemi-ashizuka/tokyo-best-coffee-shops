class CoffeeShop < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_one_attached :photo

  validates :name, :address, presence: true
end
