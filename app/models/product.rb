class Product < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { only_integer: true, :greater_than => 0 }
  validates :user_id, presence: true
end

# , numericality: =>  {:greater_than => 0}, numericality:  true
