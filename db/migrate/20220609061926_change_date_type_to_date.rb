class ChangeDateTypeToDate < ActiveRecord::Migration[6.1]
  def change
    change_column :trips, :date, :date
  end
end
