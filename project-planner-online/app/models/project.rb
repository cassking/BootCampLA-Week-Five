class Project < ActiveRecord::Base

  has_many :collaborations
  has_many :tasks, through: :collaborations
  has_many :users, through: :collaborations

  validates :name, presence: true
end
