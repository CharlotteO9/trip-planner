class CreateToTransports < ActiveRecord::Migration[7.0]
  def change
    create_table :to_transports do |t|
      t.string :type
      t.integer :price_person
      t.references :trip, null: false, foreign_key: true

      t.timestamps
    end
  end
end
