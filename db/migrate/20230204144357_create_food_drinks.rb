class CreateFoodDrinks < ActiveRecord::Migration[7.0]
  def change
    create_table :food_drinks do |t|
      t.string :title
      t.string :occasion
      t.string :address
      t.float :price_person
      t.string :photo
      t.text :comment
      t.references :trip, null: false, foreign_key: true

      t.timestamps
    end
  end
end
