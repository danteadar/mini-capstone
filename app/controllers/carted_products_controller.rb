class CartedProductsController < ApplicationController

  def index
    @carted_products = current_user.carted_products.where(status: "carted")
    if @carted_products.any? #if this doesn't work, look at dani's code.
    else
      flash[:warning] = "No items in your cart!"
      redirect_to "/"
    end
  end

  def create
    product_id = params[:product_id]
    product = Product.find_by(id: product_id)
    quantity = params[:quantity]
    carted_product = CartedProduct.create(
      quantity: quantity, 
      user_id: current_user.id,
      product_id: product_id,
      status: "carted"
      )
    flash[:success] = "Added to Cart!"
    redirect_to "/"
  end

  def destroy
    carted_product = CartedProduct.find_by(id: params[:id])
    carted_product.update(status: "removed")

    flash[:warning] = "Product removed!"
    redirect_to "/carted_product"

  end

end
