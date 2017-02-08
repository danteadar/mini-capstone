class ProductsController < ApplicationController

  before_action :authenticate_admin!, except: [:index, :show, :search]

  def index
    @products = Product.all
    
    if params[:sort]
      @products = Product.all.order(params[:sort] => params[:sort_order])
    end
    if params[:discount]
      @products = Product.where("price < ?", 30)
    end

    if params[:category]
      @products = Category.find_by(name: params[:category]).products
    end

  end

  def search
    search_term = params[:search]
    @products = Product.where("name LIKE ?", "%#{search_term}%")
    render :index
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(
      name: params[:name], 
      price: params[:price],
      description: params[:description],
      in_stock: "true",
      supplier_id: params[:supplier_id]['supplier_id']
      )

    if @product.save
      flash[:success] = "Product Created"
      redirect_to "/products/show/#{@product.id}"
    else
      render :new
    end

    #@product.images.create(url: params[:image], product_id: @product.id)

  end

  def show
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    # if product_id != "random"
      # @supplier = @product.supplier
    # end

    # if product_id == "random"
    #   @product = Product.all.sample
    #   @supplier = @product.supplier
    # end
  end

  def edit
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
  end

  def update
    product_id = params[:id]
    product = Product.find_by(id: product_id)
    product.update(
      name: params[:name],
      price: params[:price], 
      description: params[:description],
      supplier_id: params[:supplier_id]
      )
    product.save
    flash[:success] = "Product successfully updated!"
    redirect_to "/"
  end

  def destroy
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    @product.destroy
    flash[:warning] = "This is the end of that!"
    redirect_to "/"

  end

end
