class Review < ActiveRecord::Base
  validates :rating, presence: true, numericality: true
  validates_inclusion_of :rating, :in => 1..5

  belongs_to :products
end
