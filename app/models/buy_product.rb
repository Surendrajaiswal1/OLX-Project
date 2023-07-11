class BuyProduct < ApplicationRecord
  validates :contact_number,presence: true,:numericality => true,:length => { :minimum => 10, :maximum => 10 }
  belongs_to :user
  belongs_to :sell_product
  before_save :order_id

  def order_id
    self.order_id = SecureRandom.hex[0..7]
  end
end
  