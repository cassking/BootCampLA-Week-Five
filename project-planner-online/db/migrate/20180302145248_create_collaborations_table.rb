class CreateCollaborationsTable < ActiveRecord::Migration
  def change
    create_table(:collaborations) do |table|
      table.integer :user_id, null: false
      table.integer :project_id, null: false

      table.timestamps
    end
  end
end
