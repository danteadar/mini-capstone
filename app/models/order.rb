class Order < ApplicationRecord
  belongs_to :user
  has_many :carted_products
  has_many :products, through: :carted_products

  def quantify(number, quantity)
    number.to_f * quantity.to_f
  end
end