class AddColumnInCategory < ActiveRecord::Migration[7.0]
  def change
    add_column :categories, :all_category, :string
  end
end
