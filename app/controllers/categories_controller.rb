class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path
    else
      render:new
    end
  end

  def products
    @category = Category.find(params[:id])
    @by_category_id = ProductCategory.where(:category_id => [params[:id]]).pluck
    @category_products = []

    @by_category_id.collect do |join_item|
      product = Product.where(id: join_item[1])
      @category_products << product
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def category_id_params
    params.require(:category).permit(:id)
  end
end
