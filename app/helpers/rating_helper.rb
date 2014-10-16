module RatingHelper
  def average_rating
    total = 0

    @reviews.each do |review|
      total += review.rating
    end

    total/@reviews.count
  end
end
