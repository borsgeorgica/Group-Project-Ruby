# Have to add more methods
# Twitter API
require  'twitter'

class TwitterInteract
    
    def title
        'Tweet to order'
    end
     
   
    # attr_reader :client
    # constructor of the class
    def initialize()
        config = {
            :consumer_key =>  'kotU6FQ2NGg2qresRSTqdbFwV' ,
            :consumer_secret =>  'WGr1rGeHiJt7GEA8zQGEeYHy3k7rBKi1Qd6MTUGDuggygMy1nT' ,
            :access_token =>  '790958439694475264-DBBVNGq4AhkOpAtrKNjNjrzhfFenK99' ,
            :access_token_secret =>  'Do5QRy5bVsMYk9Q4BP7ImxTbIc3KCFbTgHLKcirczpcy6' 
        }
        @client = Twitter::REST::Client.new(config)
        @usernames = Array.new
        @tweets_text = Array.new
        @tweets_dates = Array.new
        
    end
    # For the moment get_tweets method returns only the username and text of the tweet
    # To add more information
    def find_tweets(keywords)
         
        tweets = @client.search("#{keywords}")
        most_recent = tweets.take(5)
        
        most_recent.each do |tweet|
            @usernames.push(tweet.user.screen_name)
            @tweets_text.push(tweet.text)
            @tweets_dates.push(tweet.created_at)
            
        end
        
      
    end
    
    def send_confirmation_tweet(username)
        @client.update("@#{username} Please confirm your order")
    end
    
    def send_registration_tweet (username)
        @client.update("@#{username} Please register first before order")    
    end
    
    
    def get_usernames() 
   
        return @usernames
        
    end
    
    def get_tweets_text()
        return @tweets_text
    end
    
<<<<<<< HEAD
    # attr_accessor :client
    # attr_accessor :usernames
    # attr_accessor :tweets_text
=======
    def get_tweets_dates()
        return @tweets_dates
    end
    
>>>>>>> 7fa09a64f1e8fd9ac3a6c075c760670dcc126bde

    
end



# tweets = client.favorites('onedirection') 
# most_recent = tweets.take(3)
# most_recent.each do |tweet|
# puts "Tweet #{tweet.id}: #{tweet.text}"
# puts "Number of retweets: #{tweet.retweet_count}"
# puts "Number of likes: #{tweet.favorite_count}"
# reply_to = tweet.in_reply_to_screen_name
# puts "This was a reply to: #{reply_to}" if !reply_to.nil?
# puts "\n"
# end


#, :geocode => "53.395037,-1.473868,1000mi"
#"#{term}", :result_type => "recent", :geocode => "#{lat},#{long},#{radius}mi")


# most_recent.each do |tweet|
#     @username = tweet.user.screen_name
#     puts "Tweet #{tweet.id}: #{tweet.text}"
#     puts "User is: #{tweet.user.screen_name}" # the user's screen name
 
#     puts "User is: #{tweet.user.name}" # the full name provided by user

# user = client.user(@username)
# # puts "Screen name: #{user.screen_name}"
# # puts "Name: #{user.name}"
# # puts "Description: #{user.description}"
# puts "Location: #{user.location}"
# # puts "Following: #{user.friends_count}"
# # puts "Followers: #{user.followers_count}"
# # puts "Web site: #{user.website}"

    
# # reply_to = tweet.in_reply_to_screen_name
# # puts "This was a reply to: #{reply_to}" if !reply_to.nil?

# # puts "Number of retweets: #{tweet.retweet_count}"
# # puts "Number of likes: #{tweet.favorite_count}"
# # reply_to = tweet.in_reply_to_screen_name
# # puts "This was a reply to: #{reply_to}" if !reply_to.nil?
# # puts "\n"
# end