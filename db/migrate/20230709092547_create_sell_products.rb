class CreateSellProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :sell_products do |t|
      t.string :name
      t.binary :image
      t.string :status
      t.integer :price
      t.string :alphanumeric_id
      t.string :description

      t.timestamps
    end
  end
end
