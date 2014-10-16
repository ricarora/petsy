class Orderitem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product
  belongs_to :cart

  validates :product_id, presence: true
  validates :qty, presence: true, numericality: { only_integer: true, :greater_than => 0 }

  ## this probably doesn't work now that cart_id still exists...
  # this will validate if a cart_id is present (cart_id is set to nil order is saved)
  validates :order_id, presence: true, unless: :in_cart?

  def in_cart?
    cart_id != nil
  end
end
