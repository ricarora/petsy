class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def newcategory
    @categories = Category.all
    @product = Product.find(params[:id])
  end

  def new
    if session[:current_user_id]
      @categories = Category.all
      @product = Product.new
    else
      redirect_to products_path
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def show
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
      if @product.update(params.require(:product).permit(:name, :price, :description, :image_url, :stock, :is_active, :user_id))
        redirect_to products_path
      else
        render :edit
      end
  end

  def create
    @product = Product.new(params.require(:product).permit(:name, :price, :description, :image_url, :stock, :is_active, :user_id))
    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end

  def destroy
    @product = Product.all.find(params[:id])
    @product.destroy
    redirect_to products_path
  end

  def lookup
    #srch = params[:params][:search]
    srch = params[:search]
    if srch
      @products = Product.all.where('lower(name) LIKE ?', "%#{srch.downcase}%")
    else
      @products = index
    end
  end

end
