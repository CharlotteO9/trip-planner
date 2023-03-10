class CreateActivityBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :activity_bookings do |t|
      t.references :activity, null: false, foreign_key: true
      t.references :day, null: false, foreign_key: true

      t.timestamps
    end
  end
end
