class AddCoordinatesToDayts < ActiveRecord::Migration[6.1]
  def change
    add_column :dayts, :latitude, :float
    add_column :dayts, :longitude, :float
  end
end
