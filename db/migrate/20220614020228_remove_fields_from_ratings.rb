class RemoveFieldsFromRatings < ActiveRecord::Migration[6.1]
  def change
    remove_column :reviews, :title
    remove_column :reviews, :content
    add_column :reviews, :recommended, :boolean
    add_column :reviews, :busy, :integer
  end
end
