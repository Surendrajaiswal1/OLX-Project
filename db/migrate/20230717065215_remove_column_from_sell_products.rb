class RemoveColumnFromSellProducts < ActiveRecord::Migration[7.0]
  def change
        remove_column :sell_products, :image, :binary
  end
end
