class ChangeNullOnTrips < ActiveRecord::Migration[6.1]
  def change
    change_column_null :trips, :user_id, null: true
  end
end
