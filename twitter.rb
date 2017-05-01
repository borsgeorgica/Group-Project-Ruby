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
            :consumer_key =>  'um6NmgoepdW830G5CJ8PNlEay' ,
            :consumer_secret =>  'Gr9mwM0J1IHzKefKDvy3BU813qvyVq2Zy8lnp4BgiRxPpovYpz' ,
            :access_token =>  '858700735726444545-Bg02Q46IxlLAevNxdLXa2YLGoUib95X' ,
            :access_token_secret =>  'cdQT0YatbFCHNBdfmE4pCOBhcZfQCaoJJ5iY8macLZz5n' 
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
            # follow that person
            #@client.follow(tweet.user.screen_name)
  
        end 
    end
    

    def send_confirmation_tweet(username)

        @client.update("@#{username} Please confirm your order")
    end
    
    def send_registration_tweet (username)
        @client.update("@#{username} Please register first before order")    
    end
    
    def send_deny_order(username)
        @client.update("@#{username} Sorry, your order has been denied!")
    end
    
    
    def get_usernames() 
   
        return @usernames
        
    end
    
    def get_tweets_text()
        return @tweets_text
    end
    

    def get_tweets_dates()
        return @tweets_dates
    end
       
end
