class Order < ActiveRecord::Base
  has_many :orderitems, inverse_of: :order
  has_many :products, through: :orderitems

  # validates that orderitems are attached to order (on order.update(status: "paid"))
  ### Currently errors ("Validation failed: Orderitems can't be blank"), but orderitems is associated in rails console??
  validates :orderitems, presence: true, if: :paid_status?

  # validates the credit card form
  validates :name_on_card, :card_number, :security_code, :zip, :email, :address, :city, :state, :card_exp, presence: true

  # re-validates orderitems when order is placed (verifying that they belong to an order)
  validates_associated :orderitems

  def paid_status?
    status == "paid"
  end
end


## Kate's ideas:
# 1. a custom validation that checks to see if any orderitems have matching order_id
# 2. a new column that keeps track of number of associated orderitems and validates its presence
