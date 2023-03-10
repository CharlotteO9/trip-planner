class DeleteDayChangeDurationToActivities < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :activities, :days
  end
end
