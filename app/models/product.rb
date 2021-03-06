class Product < ApplicationRecord

  belongs_to :supplier
  has_many :images
  has_many :categorized_products
  has_many :categories, through: :categorized_products
  has_many :carted_products
  has_many :orders, through: :carted_products

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :description, presence: true
  validates :description, length: { maximum: 500 }
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }

  def sale_message
    # product_id = params[:id]
    # @product = Product.find_by(id: product_id)
    if price.to_i <= 2
      :discount == ".discount"
      return "Discount Item!"
    else
      return "Everyday Value!"
    end
  end

  def tax
    return price.to_f * 0.09
  end

  def total
    return price.to_f + tax
  end

end



