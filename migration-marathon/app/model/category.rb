class Category < ActiveRecord::Base

  has_many :bookcategories
  has_many :books, through: :bookcategories


  validates :name, uniqueness: true


end
