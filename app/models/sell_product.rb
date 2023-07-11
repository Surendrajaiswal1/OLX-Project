class SellProduct < ApplicationRecord
  validates :name,length: {minimum: 2}
  validates :image,presence: true
  validates :price,presence: true, :numericality => true
  validates_inclusion_of :status, :in => ["available", "sold"]
  validates :description,presence: true,length: {minimum: 10}
  belongs_to :user
  belongs_to :category
  has_many :buy_products,dependent: :destroy
  has_one_attached :image
  before_save :before_save1
    
    def before_save1
      self.alphanumeric_id= SecureRandom.hex[0..7]
    end
  end
  