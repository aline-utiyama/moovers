class Mover < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :users, through: :bookings
  has_one_attached :image
  validates :name, :type_of_car, :description, :price, :image, :address, presence: true
  SIZE_OF_CARS = ['Small', 'Medium', 'Large', 'XLarge']

  include PgSearch::Model
  pg_search_scope :search_by_type_of_car,
    against: [:type_of_car],
    using: {
      tsearch: { prefix: true }
    }
end
