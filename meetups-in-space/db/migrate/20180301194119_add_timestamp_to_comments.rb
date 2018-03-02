class AddTimestampToComments < ActiveRecord::Migration
  def change
    change_table :comments do |table|
      table.timestamps
    end
  end
end
