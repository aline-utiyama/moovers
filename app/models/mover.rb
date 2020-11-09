class Mover < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :users, through: :bookings
  validates :name, :type_of_car, :description, :price, presence: true
  CARS = ['Small', 'Medium', 'Large', 'XLarge']
end
