class Order < ActiveRecord::Base
  has_many :orderitems
  has_many :products, through: :orderitems
  belongs_to :user

  # validates that orderitems are attached to order (on order.update(status: "paid"))
  validates :orderitems, presence: true, unless: :pending?

  # validates the credit card form
  validates :name_on_card, :card_number, :security_code, :zip, :address, :city, :state, :card_exp, presence: true
  validates :email, presence: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "valid email address" }
  validate :expiration_date_cannot_be_in_the_past
  validates :card_number, length: { minimum: 12, maximun: 16 }
  validates :security_code, length: { minimum: 3, maximun: 4 }
  validates :zip, length: { is: 5 }

  def pending?
    status == "pending"
  end

  def expiration_date_cannot_be_in_the_past
    if card_exp.present? && card_exp < Date.today
      errors.add(:card_exp, "can't be in the past")
    end
  end
end
