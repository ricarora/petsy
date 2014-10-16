class Order < ActiveRecord::Base
  has_many :orderitems
  has_many :products, through: :orderitems

  # WHY WON"T THIS WORK?!
  include ActiveModel::Validations
  validates_with MyValidator

  #this will validate orderitems when order is created (and verify that they belong to an order)
  validates_associated :orderitems
end

class MyValidator < ActiveModel::Validator
  def validate(record)
    if record.orderitems.length < 1
      record.errors[:orderitems] << "One or more orderitems required"
    end
  end
end
