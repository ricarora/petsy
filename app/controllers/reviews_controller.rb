class ReviewsController < ApplicationController

  def index
    @reviews = Review.where(product_id: params[:id])
  end

  def new
    @review = Review.new
    @levels = [1,2,3,4,5]
  end

  def create
    @review = Review.new(review_params)
    @review.product_id = params[:id]
    author?
    if @review.save
      redirect_to product_reviews_path
    else
      render:new
    end
  end

  def author?
    if @review.author.empty?
      @review.author = nil
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :title, :comment, :author, :id)
  end
end
