class AddUsersToDayts < ActiveRecord::Migration[6.1]
  def change
    add_reference :dayts, :user, foregin_key: true, null: false
  end
end
