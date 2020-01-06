require 'sinatra/activerecord'
require 'sinatra'
require 'sinatra/flash'
require 'pg'
require './models'




set :port, 3000


enable :sessions

set :database, {adapter: 'postgresql', database: 'socialmedia', username: 'postgres', password: 'Facingyak8'}
#home

get '/' do
  erb :home
end

# signup
get '/signup' do
  erb :signup
end


post '/signup' do
  @user = User.new(params[:user])
  if @user.valid?
  @user.save
  session[:id] = @user.id
  redirect '/profile'
else
  flash[:error] = @user.errors.full_message
  redirect '/signup'
end

end


#login
get '/login' do
  erb :login
end


post '/login' do
    @user = User.find_by(email: params[:email])
    @password_attempt = params[:password]
    if @user.password == @password_attempt
      flash[:notice] = "You have logged in sucessfuly!"
      session[:user_id] = @user.id
      redirect '/profile'
    else
      flash[:error] = "invalid password"
      redirect "/login"
    end
  end


#profile
get '/profile' do
  erb :profile
end



get '/logout' do
  session.clear
  puts "you have sucessfully logged out"
end
