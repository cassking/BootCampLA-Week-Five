class Book < ActiveRecord::Base
  has_many :checkouts
  
  has_many :bookcategories
  has_many :categories, through: :bookcategories

  validates :rating, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 100}, allow_nil: true
end
