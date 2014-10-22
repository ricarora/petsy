class Review < ActiveRecord::Base
  validates :rating, presence: true, numericality: true
  validates_inclusion_of :rating, :in => (1..5)

  validates :comment, presence: true

  belongs_to :product
end

  validate do |review|
    UserValidator.new(review).validate
  end
  
class UserValidator < ActiveModel::Validator
  def initialize(review)
   @review = review
  end

  def validate
    if @review.user_id == @review.product.user_id
      @review.errors[:user_id] << "You cannot review your own product."
    end
  end
end
