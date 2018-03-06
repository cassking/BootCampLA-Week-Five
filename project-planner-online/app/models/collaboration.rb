class Collaboration < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  belongs_to :task
end
