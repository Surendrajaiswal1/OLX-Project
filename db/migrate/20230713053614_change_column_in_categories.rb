class ChangeColumnInCategories < ActiveRecord::Migration[7.0]
  def change
    remove_column :categories, :all_category, :string
    remove_column :categories, :all_categories, :string
    add_column :categories, :category_name, :string
  end
end
