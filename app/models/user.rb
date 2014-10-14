class User < ActiveRecord::Base
  has_many :products
  validates :username, :name, presence: true
  has_secure_password
end
