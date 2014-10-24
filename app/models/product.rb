class Product < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { only_integer: true, :greater_than => 0 }
  validates :description, length: {maximum: 400 }
  has_many :categories, through: :productcategories
  has_many :productcategories
  belongs_to :user
  has_many :reviews
  has_many :orderitems

  validates :user_id, presence: true
end

# , numericality: =>  {:greater_than => 0}, numericality:  true
