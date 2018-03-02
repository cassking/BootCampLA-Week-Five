require "sinatra"
require "pg"
require_relative "./app/models/article"
require "pry" if development? || test?
require "sinatra/reloader" if development?
set :bind, '0.0.0.0'  # bind to all interfaces
set :views, File.join(File.dirname(__FILE__), "app", "views")

configure :development do
  set :db_config, { dbname: "news_aggregator_development" }
end

configure :test do
  set :db_config, { dbname: "news_aggregator_test" }
end

def db_connection
  begin
    connection = PG.connect(Sinatra::Application.db_config)
    yield(connection)
  ensure
    connection.close
  end
end

# Put your News Aggregator server.rb route code here
get '/' do
  # binding.pry
  redirect '/articles'
end

post "/articles/new" do
  @title = params['title']
  @url = params['url']
  @description = params['description']
  if !@title.empty? && !@url.empty? && !@description.empty?
    # Insert new article into the database
     db_connection do |conn|
       conn.exec_params("INSERT INTO articles (title,url,description) VALUES ($1,$2,$3)", [@title,@url,@description])
     end
      redirect '/'
   else
       @error= "ERROR Please fill in all fields"
       erb :new
     end

end
post '/articles/new' do
  article = Article.new("title" => params[:title], "url" => params[:url], "description" => params[:description])

  article.save

  redirect '/'
end
get "/articles" do
  @articles = nil
  @articles = db_connection { |conn| conn.exec("SELECT * FROM articles") }
  erb :index
  # binding.pry
end
# get "/articles" do
#   # binding.pry
#     @articles = Article.all
# end


get "/articles/new" do
    erb :new
end
