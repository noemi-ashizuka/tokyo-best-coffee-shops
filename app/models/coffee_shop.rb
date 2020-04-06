class CoffeeShop < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_one_attached :photo
  has_one_attached :url_image

  validates :name, :address, presence: true
end
