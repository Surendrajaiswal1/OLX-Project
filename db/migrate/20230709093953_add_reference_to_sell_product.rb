class AddReferenceToSellProduct < ActiveRecord::Migration[7.0]
  def change
    add_reference :sell_products, :user, null: false, foreign_key: true
    add_reference :sell_products, :category, null: false, foreign_key: true
  end
end
