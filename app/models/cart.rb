class Cart < ActiveRecord::Base
  has_many :orderitems
  has_many :products, through: :orderitems
end
