class FoodDrink < ApplicationRecord
  belongs_to :trip
  has_many :food_drink_bookings
end
