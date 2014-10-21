class ProductcategoriesController < ApplicationController

  def index
    @productcategories = Productcategory.all
  end

  def create
    @product = Product.find(params[:id])
    params[:category].each do |id|
     @productcategory = Productcategory.new
     @productcategory.category_id = id
     @productcategory.product_id = @product.id
        if @productcategory.save
          render:root_path
        else
          redirect_to products_path
        end
    end
  end
end
