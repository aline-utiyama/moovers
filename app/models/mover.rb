class Mover < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :users, through: :bookings
  validates :name, :type_of_car, :description, :price, presence: true
  SIZE_OF_CARS = ['Small', 'Medium', 'Large', 'XLarge']
  CARS = ['2021 Acura RDX', 'Dodge Challenger', 'Infiniti QX80,', 'Toyota, monster truck', 'Cadillac Escalade ESV', 'Cargo Van', 'Ford Transit Wagon']
end
