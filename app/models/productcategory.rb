class Productcategory < ActiveRecord::Base
  validates :product_id, presence: true
  validates :category_id, presence: true
  validates :category_id, uniqueness: {scope: :product_id,
    message: "This category is already associated with the product."}
  belongs_to :product
  belongs_to :category
end
