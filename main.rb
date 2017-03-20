
require 'sinatra'
#require 'sinatra/reloader'
require_relative 'twitter.rb'
require_relative 'validate.rb'
require 'sqlite3'

include ERB::Util


enable :sessions
set :session_secret, 'super secret'

set :bind, '0.0.0.0' # Only needed if you're running from Codio


before do
    @db = SQLite3::Database.new './database/database_new.sqlite'
    
    
    

end

get '/' do
    redirect '/login' unless session[:logged_in]
    erb :index

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
    count = @db.get_first_value(
        'SELECT COUNT(*) FROM personal_details WHERE email = ?',
        [@email])
    @unique = (count == 0)
    @all_ok = @username_ok && @unique
    @user_level = 2

    # add data to the database
    if @all_ok

        @db.execute(
            'INSERT INTO personal_details VALUES (?, ?, ?, ?, ?, ?)',
            [@username, @name, @surname, @email , @contact_number, @address])

         @db.execute(
            'INSERT INTO log_in VALUES (?, ?, ?)',
            [@username,  @password, @user_level])
        redirect '/client/panel'
    end

    erb :register

end

get '/login' do
     erb :login
end

post '/login' do

    unless params[:username].nil? || params[:password].nil?
        username = params[:username].strip

        @results = @db.get_first_value('SELECT Password FROM log_in WHERE TwitterUsername = ?', [username])
        puts "#{@results}"

        if(@results == params[:password])
            
             session[:logged_in] = true
             session[:login_time] = Time.now
            
             
                
             redirect '/client/panel'
        end
    end


     @error = "Password incorrect"
     erb :login

end

get '/logout' do
    session.clear
    redirect '/login'
#     erb :logout
end

get '/client/panel' do
    erb :"client/panel"
end

get '/client/settings' do
    erb :"client/settings"
end

post '/client/settings' do
    
    @submitted = true
    @username = "bors_georgica"
    @email = params[:email].strip
    @password = params[:password].strip
    @contact_number = params[:tel].strip
    @post_code = params[:postcode].strip
    @address = params[:address].strip

    # perform validation
    @username_ok = !@username.nil? && @username !=""

    @all_ok = @username_ok
    @user_level = 2

    # add data to the database
    if @all_ok

        @db.execute(
            'UPDATE personal_details SET Email = ?, ContactNumber =  ?, Address =  ? WHERE TwitterUsername = ?',
            [@email , @contact_number, @address,@username])
        
         @db.execute(
            'UPDATE log_in SET Password = ? WHERE TwitterUsername = ?',
            [@password, @username])
        redirect '/client/panel'
        
    end
    
    
    erb :"client/settings"
end
    

get '/admin/index' do
    t = TwitterInteract.new()
    t.find_tweets("@spicyslice #order") #keyword as paramater
    @usernames = t.get_usernames()
    @tweets_text = t.get_tweets_text()
      # validate user name
    
    (0...@usernames.length).each do |i|
        if(@usernames[i]!=nil)
            if(check_user_exists(@db,@usernames[i])!= true)
                puts "Foreign user has been found"
                @usernames.delete_at(i)
                @tweets_text.delete_at(i)
            end
        else
            # send back a tweet to the user and ask to register first
            # in order to make an ordder
            # This will be completed in second iteration 
        end
        
    
    end
  
    erb :"admin/index"
end

post '/admin/index' do

    @check = params[:check]
    @function = params[:function]
    if @check == "confirm" && @function == "confirm"
        puts "nil ................."

    end
#     name = params[:value].strip
#     puts "#{name}"
    redirect '/admin/index'
end


get '/admin/accepted' do
    erb :"admin/accepted"
end

get '/admin/users' do
    erb :"admin/users"
end

get '/admin/editusers' do
    erb :"admin/editusers"
end

get '/admin/twitter' do
    erb :"admin/twitter"
end
