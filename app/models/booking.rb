class Booking < ApplicationRecord
  belongs_to :mover
  belongs_to :user

  geocoded_by :start_point, latitude: :start_latitude, longitude: :start_longitude
  geocoded_by :end_point, latitude: :end_latitude, longitude: :end_longitude
  after_validation :geocode
end
