class Hotel < ApplicationRecord
  belongs_to :trip
  has_many :hotel_bookings, dependent: :destroy
end
