require "minitest/autorun"
require_relative "./twitter"
require_relative "./register"
require_relative "./login"

# Could not figure out how to minitest ruby file which was not under a class

class TestTwitterInteract < Minitest::Test
    
    # attr_accessor :client
    # attr_accessor :usernames
    # attr_accessor :tweets_text
    
    def setup
        @twitter = TwitterInteract.new
    end
    
    def test_title_is_tweet_to_order
        assert_equal 'Tweet to order', @twitter.title
    end
    
    # Could not fix this error
    def test_find_tweets
        assert_equal "User is: #{tweet.user.screen_name}", @twitter.find_tweets(keywords)
    end
   
    # Could not fix this error
    def test_send_confirmation_tweet
        assert_equal @client.update("@#{username} Please confirm your order"), @twitter.send_confirmation_tweet(username)
    end
    
    # Expected nil
    def test_get_usernames
        assert_nil @usernames, @twitter.get_usernames()
    end
    
    def test_tweets_text
        assert_nil @tweets_text, @twitter.get_tweets_text()
    end
    
    def test_tweets_dates
        assert_nil @tweets_dates, @twitter.get_tweets_dates()
    end
    
end

# class TestLogin < Minitest::Test
#    
#    def setup
#        @login = Login.new
#    end
#    
#    def test_title_is_login
#        assert_equal 'Login', @login.title
#    end
#    
# end
    
    
