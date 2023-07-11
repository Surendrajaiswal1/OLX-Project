class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :all_categories

      t.timestamps
    end
  end
end
