class HotelBooking < ApplicationRecord
  belongs_to :day
  belongs_to :hotel
end
