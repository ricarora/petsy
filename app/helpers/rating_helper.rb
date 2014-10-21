module RatingHelper
  def average_rating
    total = 0

    @product.reviews.each do |review|
      total += review.rating
    end

    total/@product.reviews.count
  end
end
