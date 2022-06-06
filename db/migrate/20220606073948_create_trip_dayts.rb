class CreateTripDayts < ActiveRecord::Migration[6.1]
  def change
    create_table :trip_dayts do |t|
      t.integer :order
      t.references :trip, null: false, foreign_key: true
      t.references :dayt, null: false, foreign_key: true

      t.timestamps
    end
  end
end
