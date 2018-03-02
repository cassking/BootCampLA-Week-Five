class Recipe < ActiveRecord::Base
  has_many :comments
  validates :title, uniqueness: true
  validates :servings, allow_blank: true, numericality: { greater_than_or_equal_to: 1 }
end
