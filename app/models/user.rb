class User < ApplicationRecord
  validates :name,format: { with: /\A[a-z A-Z]+\z/ }, presence: true
  validates :email,presence: true,uniqueness: true,format: {with: URI::MailTo::EMAIL_REGEXP}
  validates :password,presence: true, length: {minimum: 3}
  has_many :sell_products, dependent: :destroy
  has_many :buy_products,dependent: :destroy
  before_save :remove_spaces

  def remove_spaces
    self.name = name.strip()
    self.email = email.strip()
  end
end
  