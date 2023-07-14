class ProductsCategorywiseSerializer < ActiveModel::Serializer
  attributes :category_name

  has_many :sell_products
end
