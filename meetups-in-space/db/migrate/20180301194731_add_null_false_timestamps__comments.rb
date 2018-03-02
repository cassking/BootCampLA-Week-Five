class AddNullFalseTimestampsComments < ActiveRecord::Migration
  def change
    change_column_null :comments, :created_at, false
    change_column_null :comments, :updated_at, false
  end
end
