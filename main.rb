
require 'sinatra'
#require 'sinatra/reloader'
require_relative 'twitter.rb'
require_relative 'validate.rb'

require 'sqlite3'
require 'date'
require 'erb'

require_relative 'login.rb'
require_relative 'register.rb'
require_relative 'orders.rb'

include ERB::Util


enable :sessions
set :session_secret, 'super secret'

set :bind, '0.0.0.0' # Only needed if you're running from Codio


before do
    
    @db = SQLite3::Database.new './database/database_final.sqlite'
    @twitter = TwitterInteract.new()
    $current_username
    $usernames # might not need it
    $last_tweet_date
    $orders
    
    
    ### read from the file
    File.open("last_order.txt").each do |line|
        $last_tweet_date = DateTime.parse(line.to_s)
    end
        
end

get '/' do
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
    @storelocation = params[:location].strip
    @address = params[:address].strip
    
    if(register_user(@db,@username,@name,@surname,@email,@password,@contact_number,@storelocation,@address))
        @registersuccess = true
        erb :login
    else
        @error = true
        erb :register
    end

end

get '/login' do
     erb :login
end

post '/login' do

    unless params[:username].nil? || params[:password].nil?
        username = params[:username].strip
        password = params[:password].strip    

        if(login(@db,username,password))
            
             session[:logged_in] = true
             session[:login_time] = Time.now
             $current_username = username
             redirect '/client/panel'
        else
            @error = true
            erb :login
        end
    end   
end

get '/logout' do
    session.clear
    redirect '/login'

end

get '/client/panel' do
    @user = $current_username
    redirect '/login' unless session[:logged_in]

    erb :"client/panel"
end

get '/client/settings' do
    erb :"client/settings"
end

post '/client/settings' do
    
    @submitted = true
    @username = $current_username
    @email = params[:email].strip
    @password = params[:password].strip
    @contact_number = params[:tel].strip
    @post_code = params[:postcode].strip
    @storelocation = params[:location].strip
    @address = params[:address].strip

   

    # add data to the database
    if (update_details(@db,@username, @email, @password, @contact_number,@post_code,@storelocation, @address))
        redirect '/client/panel'
    else
        erb :"client/settings"
    end 
end
    

get '/admin/index' do
    
    @twitter.find_tweets("@spicyslice") #keyword as paramater
    @usernames = @twitter.get_usernames()
    @tweets_text = @twitter.get_tweets_text()
    @tweets_dates = @twitter.get_tweets_dates()
    @newest_order = DateTime.parse(@tweets_dates[0].to_s)
      # validate user name
    
    (0...@usernames.length).each do |i|
        if(@usernames[i]!=nil)
            if(check_user_exists(@db,@usernames[i])!= true)
                puts "Foreign user has been found"
 
                @usernames.delete_at(i)
                @tweets_text.delete_at(i)
                @tweets_dates.delete_at(i)
               
                @twitter.send_registration_tweet(@usernames[i])
                # send back a tweet to the user and ask to register first
                # in order to make an ordder
           
            else
                @current_date = DateTime.parse(@tweets_dates[i].to_s)
                
                if @current_date > $last_tweet_date
                    
                    if @tweets_text[i].include? "#order"
                        add_order(@db, @usernames[i], @tweets_text[i],@tweets_dates[i].to_s)
                        if @current_date > @newest_order
                                @newest_order = @current_date
                        end
                    end
                    
                    if @tweets_text[i].include? "#confirm"
                        update_order_confirm(@db, @usernames[i], @tweets_dates[i].to_s)
                         # update the order status in the database
                        # with "confirmed
                    end       
                    
                    if @tweets_text[i].include? "#feedback"
                    # add to feedback table
                        add_feedback_tweet(@db,@usernames[i], @tweets_text[i], @tweets_dates[i].to_s)
                    end
                end
            end
        end
    end
    $last_tweet_date = @newest_order
    save_to_file()
   
    #$usernames = @usernames
    
    @orders = get_processing_orders(@db)
    $orders = @orders
  
    erb :"admin/index"
end

post '/admin/index' do
    
     @button = params[:button]
     @number = params[:number]
     
     if(@button == "accept")
         # update the order to "accepted"
         update_order_accept(@db,$orders[@number.to_i-1].instance_variable_get(:@date))
         
     elsif(@button == "confirm")
         @twitter.send_confirmation_tweet($orders[@number.to_i-1].instance_variable_get(:@username))
     elsif(@button == "deny")
         # send a tweet
         @twitter.send_deny_order($orders[@number.to_i-1].instance_variable_get(:@username))
         #$usernames[@number.to_i]
         # delete the order
         delete_order(@db, @number)
         update_order_id(@db)
     elsif(@button == "delivery")
         #
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
    # load the feedback tweets from the database
    @feedback = get_feedback_tweets(@db)
    erb :"admin/twitter"
end

def save_to_file 
#     File.open("last_order.txt") do |line|
#         line.puts $last_tweet_date.to_s
#     end
     File.write('last_order.txt', $last_tweet_date)
end

not_found do
    '[404] We are really sorry you ran into trouble, kindly go back to our main site #SpicySlice'
end

error do 
    'You clearly are lost or we are down, find updates on our twitter @Spicy_Slice'
end