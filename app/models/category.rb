class Category < ApplicationRecord
  has_many :sell_products,dependent: :destroy
  validates :all_category,presence: true,uniqueness: true
  before_save :spaces
  
  def spaces
    self.all_category = all_category.strip()
  end
end
  