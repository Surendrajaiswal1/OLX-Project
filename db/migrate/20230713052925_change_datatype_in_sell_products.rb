class ChangeDatatypeInSellProducts < ActiveRecord::Migration[7.0]
  def change
    change_column :sell_products, :status, :integer
  end
end
