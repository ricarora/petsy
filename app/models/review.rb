class Review < ActiveRecord::Base
  validates :rating, presence: true, numericality: true
  validates_inclusion_of :rating, :in => 1..5

  validates :comment, presence: true
  
  belongs_to :products
end
