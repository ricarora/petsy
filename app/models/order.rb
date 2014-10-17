class Order < ActiveRecord::Base
  has_many :orderitems
  has_many :products, through: :orderitems

  # # See line 58 of orders_controller: orders need to be associated with an orderitem to save
  # # but orderitems can't be associated to the order without an order id
  # # which isn't created until an order is saved. How can you validate that...?
  # validates :orderitems, presence: true

  # validates the credit card form
  validates :name_on_card, :card_number, :security_code, :zip, :email, :address, :city, :state, :card_exp, presence: true

  # re-validates orderitems when order is placed (verifying that they belong to an order)
  validates_associated :orderitems

  def pending?
    status == "paid"
  end
end
