class CoffeeShop < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_one_attached :photo
  has_one_attached :url_image
  geocoded_by :address
  after_validation :geocode, :reverse_geocode, if: :will_save_change_to_address?
  before_validation :geocode, on: %i[create update]

  validates :name, :address, presence: true

  include PgSearch::Model 
  pg_search_scope :search_by_name_address_and_description,
    against: [ :name, :address, :description ],
    using: {
      tsearch: { prefix: true }
    }
end
