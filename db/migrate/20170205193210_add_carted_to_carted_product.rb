class AddCartedToCartedProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :carted_products, :carted, :string
  end
end
