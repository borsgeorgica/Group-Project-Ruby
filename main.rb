
require 'sinatra'
require_relative 'twitter.rb'
require 'sqlite3'

include ERB::Util


enable :sessions
set :session_secret, 'super secret'

set :bind, '0.0.0.0' # Only needed if you're running from Codio

before do
    @db = SQLite3::Database.new './database/database.sqlite'
    
end


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
    erb :"admin/order"
end


get  '/index'  do
    erb :index
end



get '/register' do
     @submitted = false
     erb :register
end

post '/register' do
    @submitted = true
    
    # sanatize values
    @username = params[:username].strip
    @name = params[:name].strip
    @surname = params[:surname].strip
    @email = params[:email].strip
    @password = params[:password].strip
    @contact_number = params[:number].strip
    @address = params[:address].strip
    
    # perform validation
    @username_ok = !@username.nil? && @username !=""
#     count = @db.get_first_value(
#         'SELECT COUNT(*) FROM user WHERE email = ? AND number = ?',
#         [@email,@contact_number])
    @unique = true #(count == 0)
    @all_ok = @username_ok && @unique
    
    # add data to the database
    if @all_ok
        
        @db.execute(
            'INSERT INTO user VALUES (?, ?, ?, ?, ?, ?, ?)',
            [@username, @name, @surname, @email, @password, @contact_number, @address])
        redirect '/index'
    end
    
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

get '/client/logout-test' do
    erb :"client/logouttest"
end

get '/client/panel' do
    erb :"client/panel"
end