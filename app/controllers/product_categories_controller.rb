class ProductCategoriesController < ApplicationController

  def index
    @productcategories = ProductCategory.all
  end

  def create
    @productcategory = ProductCategory.new(params.require(:product).permit(:id))
    if @productcategory.save
      redirect_to root_path
    else
      render:root_path
    end
  end

  private

end
