class CreateFoodDrinkBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :food_drink_bookings do |t|
      t.references :day, null: false, foreign_key: true
      t.references :food_drink, null: false, foreign_key: true

      t.timestamps
    end
  end
end
