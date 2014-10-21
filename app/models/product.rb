class Product < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { only_integer: true, :greater_than => 0 }
  has_many :categories, through: :product_categories
  has_many :product_categories
  belongs_to :user
  has_many :reviews
  has_many :orderitems

  # validates :user_id, presence: true
end

# , numericality: =>  {:greater_than => 0}, numericality:  true
