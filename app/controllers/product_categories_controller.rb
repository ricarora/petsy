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
    # @productcategory.category_id = @product.params.require(:product).permit(:category_id)
        unless @productcategory.save
          render:root_path
        end
    end
    redirect_to "/products"
  end

  private

  def productcategory_params
    params.require(:product).permit(:product_id, :category_id)
  end

end
