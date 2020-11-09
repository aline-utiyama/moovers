class Booking < ApplicationRecord
  belongs_to :mover
  belongs_to :user
end
