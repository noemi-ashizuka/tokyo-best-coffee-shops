class User < ApplicationRecord
  acts_as_token_authenticatable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :coffee_shops
  has_many :reviews, dependent: :destroy

  has_one_attached :photo

  def my_shops
    CoffeeShop.where(user_id: id)
  end
end
