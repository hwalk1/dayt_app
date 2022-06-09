class AddStatusToTripDayts < ActiveRecord::Migration[6.1]
  def change
    add_column :trip_dayts, :status, :integer, default: 0, null: false
  end
end
