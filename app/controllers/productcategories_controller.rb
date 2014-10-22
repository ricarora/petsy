class ProductcategoriesController < ApplicationController

  def index
    @productcategories = Productcategory.all
  end

  def create
     @product = Product.find(params[:id])
     @productcategory = Productcategory.new
     @productcategory.category_id = params[:category_id]
     @productcategory.product_id = @product.id
     @productcategory.save
     redirect_to new_product_category_path
  end

  def destroy
    Productcategory.find_by(product_id: params[:id], category_id: params[:category_id]).destroy
    redirect_to new_product_category_path
  end
end
