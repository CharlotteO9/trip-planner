class CreateBudgets < ActiveRecord::Migration[7.0]
  def change
    create_table :budgets do |t|
      t.float :transport_to
      t.float :transport_there
      t.float :hotel
      t.float :activities
      t.float :food_drink
      t.references :trip, null: false, foreign_key: true

      t.timestamps
    end
  end
end
