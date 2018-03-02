class Meetup < ActiveRecord::Base
  has_many :memberships
  has_many :comments
  has_many :users, through: :memberships


  #validations need to go jhere
  validates :location, :description, presence: true
  validates :name, uniqueness: true, length: { in: 2..50 }
  validates :description, length: { maximum: 2000 }
end
