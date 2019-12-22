require 'sinatra/activerecord'
require 'sinatra'
require 'sinatra/flash'
set :port, 3000

set :database, {adapter: "sqlite3", database: "./pano.sqlite3"}


get '/' do
  erb :home
end


get '/login' do
  erb :login
  #if user is logged in, reirect to thier home page 
  end



get '/signup' do
  erb :signup
end



get '/profile' do
  erb :profile
end
