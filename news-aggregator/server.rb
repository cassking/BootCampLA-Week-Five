require "sinatra"
require 'csv'
require "pry" if development? || test?
require "sinatra/reloader" if development?
set :bind, '0.0.0.0'  # bind to all interfaces

get '/' do
  redirect '/articles'
end

post "/articles/new" do
  title = params['title']
  url = params['url']
  description = params['description']
  if !title.empty? && !url.empty? && !description.empty?
    CSV.open("articles_to_post.csv", "a") do |csv|
      csv << [title, url, description]
    end
       redirect '/'
  else
    @error= "ERROR Please fill in all fields"
    erb :form
  end
end
get "/articles" do
    @articles = CSV.read("articles_to_post.csv")
    erb :index
end


get "/articles/new" do

    erb :form
end
