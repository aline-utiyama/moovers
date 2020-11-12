class Mover < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :users, through: :bookings
  has_one_attached :image
  validates :name, :type_of_car, :description, :price, :image, presence: true
  SIZE_OF_CARS = ['Small', 'Medium', 'Large', 'XLarge']
  CARS = ['2021 Acura RDX', 'Dodge Challenger', 'Infiniti QX80,', 'Toyota, monster truck', 'Cadillac Escalade ESV', 'Cargo Van', 'Ford Transit Wagon']

  include PgSearch::Model
  pg_search_scope :search_by_type_of_car,
    against: [:type_of_car],
    using: {
      tsearch: { prefix: true }
    }
end
