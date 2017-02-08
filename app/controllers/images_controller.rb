class ImagesController < ApplicationController
  
  def new
  end

  def create
    product_id = params[:product]['product_id']
    @image = Image.create(
      url: params[:url], 
      product_id: product_id
      )

    flash[:success] = "Image successfully uploaded!"
    redirect_to "/"
  end
end
