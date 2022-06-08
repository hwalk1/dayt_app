class AddPreferencesToTrips < ActiveRecord::Migration[6.1]
  def change
    add_column :trips, :location, :string
    add_column :trips, :distance, :float
    add_column :trips, :date, :datetime
  end
end
