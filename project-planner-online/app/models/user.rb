class User < ActiveRecord::Base
  has_many :collaborations
  has_many :projects, through: :collaborations
  has_many :tasks, through: :projects

  validates :first_name, presence: true
  validates :last_name, presence: true
end
