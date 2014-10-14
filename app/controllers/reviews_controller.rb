class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    author?
    if @review.save
      redirect_to reviews_path
    else
      render:new
    end
  end

  def author?
    if @review.author.empty?
      @review.author = nil
    end
  end

  def average_rating
    total = 0

    @reviews.each do |review|
      total += review.rating
    end

    total/@reviews.count
  end

  private

  def review_params
    params.require(:review).permit(:rating, :title, :comment, :author)
  end
end
