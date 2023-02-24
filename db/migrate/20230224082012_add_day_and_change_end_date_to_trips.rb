class AddDayAndChangeEndDateToTrips < ActiveRecord::Migration[7.0]
  def change
    add_column :trips, :day, :integer
    remove_column :trips, :end_date_date
    add_column :trips, :end_date, :date
  end
end
