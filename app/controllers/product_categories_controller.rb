class ProductCategoriesController < ApplicationController

  def index
    @productcategories = ProductCategory.all
  end

  def create
    @product = Product.find(params[:id])
    params[:category].each do |id|
     @productcategory = ProductCategory.new
     @productcategory.category_id = id
     @productcategory.product_id = @product.id
        unless @productcategory.save
          render:root_path
        end
    end
    redirect_to products_path
  end
end
