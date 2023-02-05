class CreateTrips < ActiveRecord::Migration[7.0]
  def change
    create_table :trips do |t|
      t.string :title
      t.string :destination
      t.string :photo
      t.integer :number_people
      t.date :start_date
      t.string :end_date_date
      t.text :comment
      t.integer :activity_budget
      t.integer :food_drink_budget
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
