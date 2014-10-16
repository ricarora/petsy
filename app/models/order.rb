class Order < ActiveRecord::Base
  has_many :orderitems
  has_many :products, through: :orderitems

  ## why won't this work in console?
  # validates :orderitems, presence: true

  #this re-validates orderitems when order is created (verifying that they belong to an order)
  validates_associated :orderitems
end
