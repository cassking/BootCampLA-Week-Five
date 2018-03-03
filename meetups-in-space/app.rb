require 'sinatra'
require_relative 'config/application'
require "pry" if development? || test?
set :bind, '0.0.0.0'  # bind to all interfaces

helpers do
  def current_user
    if @current_user.nil? && session[:user_id]
      @current_user = User.find_by(id: session[:user_id])
      session[:user_id] = nil unless @current_user
    end
    @current_user
      # binding.pry
  end
end

get '/' do
  redirect '/meetups'
end

get '/auth/github/callback' do
  user = User.find_or_create_from_omniauth(env['omniauth.auth'])
  session[:user_id] = user.id
  flash[:notice] = "You're now signed in as #{user.username}!"

  redirect '/'
end

get '/sign_out' do
  session[:user_id] = nil
  flash[:notice] = "You have been signed out."

redirect '/'
end

get '/meetups' do
  # this has no data to pull need to build
  @meetups = Meetup.order(:name)
   # binding.pry
  erb :'meetups/index'
end




get '/meetups/new' do
  erb :'meetups/create'
end
#user of create! vs create
# how failed saves
# are handled. When updating an ActiveRecord
# class the ! version will raise
# an exception if the record is invalid.
#http://api.rubyonrails.org/classes/ActiveRecord/Base.html
#add an exclamation point (!)
# on the end of the dynamic finders to get them
# to raise an ActiveRecord::RecordNotFound error
#  if they do not return any records, like
#    Person.find_by_last_name!.


post '/meetups/new' do

    @creator = session[:user_id]
    @name = params[:name]
    @location = params[:location]
    @description = params[:description]
    @is_creator = true
    @meetup = Meetup.create(
      name: @name,
      description: @description,
      location: @location,
      created_by: @creator
    )
    Membership.create(
      user_id: session[:user_id],
      meetup_id: @meetup.id
    )
    flash[:notice] = "You've successfully created the meetup #{@meetup.name}"
    redirect "/meetups/#{@meetup.id}"
end
 post '/meetups/delete' do

    @name = params[:name]
    @location = params[:location]
    @description = params[:description]
    if (@creator = session[:user_id])
      @meetup = Meetup.where(
        name: @name,
        description: @description,
        location: @location,
        created_by: @creator
      ).delete_all
      Membership.where(
        user_id: session[:user_id],
        meetup_id: @meetup.id
      ).delete_all
    end

    flash[:notice] = "You've successfully deleted the meetup #{@meetup.name}"
    redirect "/meetups/"
 end

get '/meetups/:id' do
  @meetup = Meetup.find(params[:id])
  @current_user = current_user
  @users = @meetup.users
  @comments = @meetup.comments
  @creator = User.find_by(id: @meetup.created_by)
# binding.pry
  @joined = false
  if @meetup.memberships.exists?(
    user_id: session[:user_id]
  )
    @joined = true
  end

  erb :'meetups/show'
end

post '/meetups/:id/join' do
  @meetup = Meetup.find(params[:id])
    Membership.create(
      user_id: session[:user_id],
      meetup_id: @meetup.id
    )
  flash[:notice] = "Success! You have joined #{@meetup.name} "
  redirect url("/meetups/#{@meetup.id}")

end

post '/meetups/:id/leave' do
  #https://apidock.com/rails/ActiveRecord/Associations/CollectionProxy/delete
  @meetup = Meetup.find(params[:id])
    Membership.where(
      user_id: session[:user_id],
      meetup_id: @meetup.id
    ).delete_all

  flash[:notice] = "Bye! You have left #{@meetup.name} "
  redirect url("/meetups/#{@meetup.id}")

end

post '/meetups/:id/comment' do
  @meetup = Meetup.find(params[:id])
  @title = params[:title]
  @body = params[:body]

    if @meetup.memberships.exists?(
      user_id: session[:user_id]
    )
      Comment.create(
        title: @title,
        body: @body,
        user_id: session[:user_id],
        meetup_id: @meetup.id
      )
      flash[:notice] = "Success! comment added"
      redirect url("/meetups/#{@meetup.id}")
     else
       flash[:notice] = "You must be a member of the meetup to comment!"
       redirect url("/meetups/#{@meetup.id}")
    end

    redirect url("/meetups/#{@meetup.id}")

end
