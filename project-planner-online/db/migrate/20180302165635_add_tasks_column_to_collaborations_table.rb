class AddTasksColumnToCollaborationsTable < ActiveRecord::Migration
  def change
    add_column :collaborations, :task_id, :integer
  end
end
