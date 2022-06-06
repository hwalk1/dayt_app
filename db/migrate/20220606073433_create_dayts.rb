class CreateDayts < ActiveRecord::Migration[6.1]
  def change
    create_table :dayts do |t|
      t.string :title
      t.text :content
      t.string :location
      t.decimal :duration
      t.decimal :price
      t.integer :opening_time
      t.integer :closing_time
      t.string :booking_url

      t.timestamps
    end
  end
end
