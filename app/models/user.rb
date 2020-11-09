class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :movers, dependent: :destroy
  has_many :bookings
  has_many :bookings_as_mover, through: :movers, source: :bookings
  validates :name, :address, presence: true
end
