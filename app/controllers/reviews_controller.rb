class ReviewsController < ApplicationController

  def index
    @reviews = Review.where(product_id: params[:id])
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.product_id = params[:id]
    @review.user_id = session[:current_user_id]
    author
    title
    if @review.save
      redirect_to show_product_path
    else
      render:new
    end
  end

  def author
    if @review.author.empty?
      @review.author = "anonymous"
    end
  end

  def title
    if @review.title.empty?
      @review.title = "Untitled"
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :title, :comment, :author, :id)
  end
end
