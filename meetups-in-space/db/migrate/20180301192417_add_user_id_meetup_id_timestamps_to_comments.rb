class AddUserIdMeetupIdTimestampsToComments < ActiveRecord::Migration
  def change
    add_column :comments, :user_id, :integer
    add_column :comments, :meetup_id, :integer

  end

end
