class CreateDaytTags < ActiveRecord::Migration[6.1]
  def change
    create_table :dayt_tags do |t|
      t.references :dayt, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
