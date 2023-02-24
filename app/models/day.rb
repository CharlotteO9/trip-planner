class Day < ApplicationRecord
  belongs_to :trip
  has_many :hotel_bookings
  has_many :activities
  has_many :food_drink_bookings
end
