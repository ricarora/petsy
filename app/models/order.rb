class Order < ActiveRecord::Base
  has_many :orderitems
  has_many :products, through: :orderitems

  ## why won't this work in console?
  # validates :orderitems, presence: true

  #this re-validates orderitems when order is created (verifying that they belong to an order)
  # validates_associated :orderitems

  ## trying to validate the credit card form
  # validates :name_on_card, :card_number, :security_code, :zip, :email, :address, :city, :state, :card_exp, presence: true, unless: :pending?

  def pending?
    status == "paid"
  end
end
