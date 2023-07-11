class AddReferenceToBuyProduct < ActiveRecord::Migration[7.0]
  def change
    add_reference :buy_products, :user, null: false, foreign_key: true
    add_reference :buy_products, :sell_product, null: false, foreign_key: true
  end
end
