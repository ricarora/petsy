class ProductsController < ApplicationController
  def index
    @products = Product.all
    @orderitem = Orderitem.new
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  # def show
  #   @product = Product.find(params[:id])
  # end

  def update
    @product = Product.find(params[:id])
      if @product.update(params.require(:product).permit(:name, :price, :description, :image_url, :stock))
        redirect_to "/products"
      else
        render :edit
      end
  end

  def create
    @product = Product.new(params.require(:product).permit(:name, :price, :description, :image_url, :stock))
    if @product.save
      redirect_to "/products"
    else
      redirect_to "/products/new"
    end
  end

  def destroy
    @product = Product.all.find(params[:id])
    @product.destroy
    redirect_to "/products"
  end

end