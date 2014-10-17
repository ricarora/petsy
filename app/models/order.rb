class Order < ActiveRecord::Base
  has_many :orderitems, inverse_of: :order
  has_many :products, through: :orderitems

  # validates that orderitems are attached to order (on order.update(status: "paid"))
  validates :orderitems, presence: true, unless: :pending?

  # validates the credit card form
  validates :name_on_card, :card_number, :security_code, :zip, :email, :address, :city, :state, :card_exp, presence: true

  def pending?
    status == "pending"
  end
end
