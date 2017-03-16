
require 'sinatra'
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

get '/admin/index' do
    t = TwitterInteract.new()
    t.find_tweets("@spicyslice #order") #keyword as paramater
    @usernames = t.get_usernames()
    @tweets_text = t.get_tweets_text()
    # validate user name
    (0...@usernames.length).each do |i|
        if(check_user_exists(@db,@usernames[i])!= true)
            puts "Foreign user has been found"
            @usernames.delete_at(i)
            @tweets_text.delete_at(i)
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