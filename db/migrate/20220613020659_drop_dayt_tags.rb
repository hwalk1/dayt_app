class DropDaytTags < ActiveRecord::Migration[6.1]
  def change
    drop_table :dayt_tags
  end
end
