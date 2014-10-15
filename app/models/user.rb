class User < ActiveRecord::Base
  has_many :products
  validates :username, :name, :email, presence: true
  validates :username, :email, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 10, maximun: 20 }
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  has_secure_password
end
