class User < ActiveRecord::Base
  has_many :products
  has_many :orders

  validates :name, :email, presence: true
  validates :username, :password, :password_confirmation, presence: true, on: :create
  validates :username, :email, uniqueness: { case_sensitive: false }, on: :create
  validates :password, length: { minimum: 10, maximun: 20 }, on: :create
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  has_secure_password
end
