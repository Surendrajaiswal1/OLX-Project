class SellProduct < ApplicationRecord
  paginates_per 2
  validates :name,length: {minimum: 2}
  validates :image,presence: true
  validates :price,presence: true, :numericality => true
  validates :description,presence: true,length: {minimum: 10}
  belongs_to :user
  belongs_to :category
  has_many :buy_products, dependent: :destroy
  has_one_attached :image
  before_save :unique_id

  enum status: [ :available, :sold ]
    
  def unique_id
    id = SecureRandom.hex[0..7]
    products = SellProduct.all
    products.each do |product|
      if product.alphanumeric_id == id
        unique_id
      end
    end
    self.alphanumeric_id = id
  end
end
