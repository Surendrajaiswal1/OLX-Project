class SellProductSerializer < ActiveModel::Serializer
  attributes :id,:category, :name, :image, :alphanumeric_id, :price, :description

  def image
    object.image.url
  end 

  def category
    object.category.category_name
  end 
end
