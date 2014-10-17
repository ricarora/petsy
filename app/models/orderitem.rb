class Orderitem < ActiveRecord::Base
  belongs_to :order, inverse_of: :orderitems
  belongs_to :product
  belongs_to :cart

  # validates :product_id, presence: true
  validates :qty, presence: true, numericality: { only_integer: true, :greater_than => 0 }

  # this will validate if a cart_id is present and order_id is not (indicating it's in the cart)
  validates :order_id, presence: true, unless: :in_cart?

  def in_cart?
    true if cart_id && !order_id
  end
end
