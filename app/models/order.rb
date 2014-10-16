class Order < ActiveRecord::Base
  has_many :orderitems
  has_many :products, through: :orderitems

  ## why won't this work in console?
  # validates :orderitems, presence: true

  # validates the credit card form
  validates :name_on_card, :card_number, :security_code, :zip, :email, :address, :city, :state, :card_exp, presence: true

  # re-validates orderitems when order is placed (verifying that they belong to an order)
  validates_associated :orderitems

  def pending?
    status == "paid"
  end
end
