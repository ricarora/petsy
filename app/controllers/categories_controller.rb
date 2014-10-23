class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def new
    if find_user
      @category = Category.new
    else
      redirect_to root_path
    end
  end

  def create
    if session[:current_user_id]
      @category = Category.new(category_params)
      if @category.save
        redirect_to categories_path
      else
        render:new
      end
    else
      flash[:notice] = "You must be logged-in to add category."
      redirect_to categories_path
    end
  end

  def products
    @category = Category.find(params[:id])
    @by_category_id = Productcategory.where(:category_id => [params[:id]]).pluck
    @category_products = []

    @by_category_id.collect do |join_item|
      product = Product.where(id: join_item[1])
      @category_products << product
    end

    @products = @category_products.flatten
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def category_id_params
    params.require(:category).permit(:id)
  end
end
