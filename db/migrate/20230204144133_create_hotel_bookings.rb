class CreateHotelBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :hotel_bookings do |t|
      t.references :day, null: false, foreign_key: true
      t.references :hotel, null: false, foreign_key: true

      t.timestamps
    end
  end
end
