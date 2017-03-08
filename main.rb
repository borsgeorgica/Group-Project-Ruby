
require 'sinatra'
require_relative 'twitter.rb'

enable :sessions
set :session_secret, 'super secret'

set :bind, '0.0.0.0' # Only needed if you're running from Codio

get '/' do
    redirect '/login' unless session[:logged_in]
    erb :index
 
end


get '/orders' do  
    t = TwitterInteract.new()
    @list = t.get_tweets("@spicyslice #order") #keyword as paramater
    erb :display_tweets
end

get '/admin/order' do
    erb :order
end


get  '/index'  do
    erb :index
end

get '/register' do
     erb :register
end

get '/login' do
     erb :login
    
end

post '/login' do
#     puts params[:password]
#     puts params[:username]
    if params[:password] == 'secret' and params[:username] == 'bors'
        session[:logged_in] = true
        session[:login_time] = Time.now
        redirect '/index' 
    end
    
     @error = "Password incorrect"
     erb :login
   
end

get '/logout' do
    session.clear
    redirect '/login'
#     erb :logout
end
      
