require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require "pry" if development? || test?

require_relative './models/recipe'
require_relative './models/comment'

set :bind, '0.0.0.0'  # bind to all interfaces
get '/' do
  # binding.pry
  redirect '/recipes'
end

get '/recipes' do
  @recipes = Recipe.all
  erb :index
end


get '/recipes/:id' do
  # binding.pry
  @recipe = Recipe.find(params[:id])
  @comments = @recipe.comments
  erb :show
end
