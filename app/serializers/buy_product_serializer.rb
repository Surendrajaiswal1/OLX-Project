class BuyProductSerializer < ActiveModel::Serializer
  attributes :id, :order_id, :product_name, :price, :image

  def product_name
    object.sell_product.name
  end

  def price
    object.sell_product.price
  end

  def image
    object.sell_product.image.url
  end
end
