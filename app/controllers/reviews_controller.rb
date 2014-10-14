class ReviewsController < ApplicationController
  validates :rating, presence: true, numericality: true
  validates_inclusion_of :rating, :in => 1..5

  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to new_review_path
    else
      render:new
    end
  end

  def show

  end

  private

  def review_params
    params.require(:review).permit(:rating, :title, :comment, :author)
  end
end
