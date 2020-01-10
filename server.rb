require 'sinatra/activerecord'
require 'sinatra'
require 'sinatra/flash'
require 'pg'

require './model'

set :port, 3000


enable :sessions

set :database, {adapter: 'postgresql', database: 'socialmedia', username: 'postgres', password: ENV['POSTGRES_PW']}
#home

get '/' do
  erb :home
end

# signup
get '/signup' do
  erb :signup
end


post '/signup' do
  pp params
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
    puts params
    user = User.find_by(email:params[:email])
    given_password = params[:password]
    if given_password == user.password
      session[:user_id] = user.id
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


post '/profile' do
    @post = Post.new(params[:post])
    if @post.valid?
        @post.save
        @post= Post.all
        redirect '/profile'
      else redirect '/profile'
  end
end


get '/feed' do
  erb:feed
  @post= Post.all
end





delete '/delete' do
  user = User.find_by(email:params[:email])
  user.destroy
end


get '/delete' do
  session[:id] = @user
  @user.destroy
end

get '/logout' do
  session.clear
end
