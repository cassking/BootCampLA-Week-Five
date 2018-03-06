class AddProjectsTable < ActiveRecord::Migration
  def change
    create_table(:projects) do |table|
      table.string :name, null: false
      table.string :description

      table.timestamps
    end
  end
end
