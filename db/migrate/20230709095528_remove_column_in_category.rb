class RemoveColumnInCategory < ActiveRecord::Migration[7.0]
  def change
    remove_column :categories, :all_categories
  end
end
