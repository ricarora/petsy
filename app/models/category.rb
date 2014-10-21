class Category < ActiveRecord::Base
  validates :name, presence: true, :uniqueness => {:case_sensitive => false}

  has_many :products, through: :product_categories
  has_many :product_categories

end
