class CreateBuyProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :buy_products do |t|
      t.string :order_id
      t.integer :contact_number

      t.timestamps
    end
  end
end
