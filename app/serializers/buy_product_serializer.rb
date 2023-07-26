class BuyProductSerializer < ActiveModel::Serializer
  attributes :id, :order_id, :product_name, :price

  def product_name
    object.sell_product.name
  end

  def price
    object.sell_product.price
  end
end
