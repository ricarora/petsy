class ProductCategory < ActiveRecord::Base
  validates :product_id, presence: true
  validates :category_id, presence: true
  belongs_to :product
  belongs_to :category
end
