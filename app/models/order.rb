class Order < ActiveRecord::Base
  has_many :orderitems, inverse_of: :order # inverse_of is needed to validate the association (rails doc says)
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
