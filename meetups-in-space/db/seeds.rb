# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Example:
#

User.delete_all
Meetup.delete_all
Membership.delete_all


fake_users =[{provider: "github",  uid: "112", username: "lucabrasi", email: "lucabrasi@gmail.com", avatar_url: "https://avatars1.githubusercontent.com/u/42381"},
{provider: "github",  uid: "113",username: "vitocorrleone", email: "vito@gmail.com", avatar_url: "https://avatars1.githubusercontent.com/u/42381"},
{provider: "github",  uid: "114",username: "beyonce", email: "bae@gmail.com", avatar_url: "https://avatars1.githubusercontent.com/u/42381"},
{provider: "github",  uid: "115",username: "kelly", email: "kel@gmail.com", avatar_url: "https://avatars1.githubusercontent.com/u/42381"}]

fake_users.each do | object_attributes |
  User.create( object_attributes)
  # binding.pry
end

fake_meetups =[{name: "Fakest meetup", description: "We throw axes", location: "Philadelphia, PA",created_at: Date.today, created_by:  User.last.id},
{name: "This meetup is for meetups", description: "We throw monkeys", location: "Pittsburgh, PA",created_at: Date.today, created_by:  User.first.id},
{name: "This meetup is dope", description: "We dope", location: "Dope, PA",created_at: Date.today, created_by:  User.first.id}
]

fake_meetups.each do | object_attributes |
  Meetup.create( object_attributes)
  # binding.pry
end

fake_memberships = [
  {user_id: User.first.id, meetup_id: Meetup.last.id},
  {user_id: User.last.id, meetup_id: Meetup.first.id},
  {user_id: User.last.id, meetup_id: Meetup.first.id},
  {user_id: User.first.id,meetup_id:  Meetup.last.id}
]
# Membership.create(user_id: User.first.id, meetup_id: Meetup.first.id)
# m2 = Membership.create(user_id: User.last.id, Meetup.last.id)
fake_memberships.each do |object_attributes|
  Membership.create(object_attributes)
end

fake_comments = [
  {title: "this was fun", body: "We had lots of fun at last meetup it was great", created_at: Date.today, created_by:  User.first.id},
  {title: "this was boring", body: "never been so bored in my life We had lots of fun at last meetup it was great", created_at: Date.today, created_by:  User.last.id}
]

fake_comments.each do |object_attributes|
  Comment.create(object_attributes)
end
