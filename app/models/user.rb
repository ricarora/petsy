class User < ActiveRecord::Base
  has_many :products, :categories
  validates :username, :name, presence: true
  has_secure_password
end
