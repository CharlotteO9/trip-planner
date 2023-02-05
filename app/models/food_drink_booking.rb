class FoodDrinkBooking < ApplicationRecord
  belongs_to :day
  belongs_to :food_drink
end
