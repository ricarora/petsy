class Orderitem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product
  belongs_to :cart

  # validates :product_id, presence: true
  # validates :qty, presence: true, numericality: { only_integer: true, :greater_than => 0 }
  #
  # # this will validate if a cart_id is present (cart_id will be set to nil when added to order)
  # validates :order_id, presence: true, unless: :in_cart?

  def in_cart?
    cart_id != nil
  end
end
