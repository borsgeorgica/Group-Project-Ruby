require "minitest/autorun"
require_relative "./twitter"
require_relative "./register"
require_relative "./login"

class TestTwitterInteract < Minitest::Test
    
    attr_accessor :client
    attr_accessor :usernames
    attr_accessor :tweets_text
    
    def setup
        @twitter = TwitterInteract.new
    end
    
    def test_title_is_tweet_to_order
        assert_equal 'Tweet to order', @twitter.title
    end
    
    # Could not fix this error
    def test_find_tweets
        assert_instance_of "User is: #{tweet.user.screen_name}", @twitter.find_tweets(keywords)
    end
   
    # Could not fix this error
    def test_confirmation_tweet
        assert_equal @client.update("@#{username} Please confirm your order"), @twitter.send_confirmation_tweet(username)
    end
    
    def test_get_usernames
        assert_nil @usernames, @twitter.get_usernames()
    end
    
    def test_tweets_text
        assert_nil @tweets_text, @twitter.get_tweets_text()
    end
end

class TestRegister < Minitest::Test
    
    def setup
        @register = Register.new
    end
    
    def test_title_is_register
        assert_equal 'Register', @register.title
    end
    
    # Could not fix this error
    def test_register_user
        assert_equal 'SELECT COUNT(*) FROM personal_details WHERE email = ?', @register.register_user(db, username, name, surname, email, password, contact_number,storelocation, address)
    end
    
end

class TestLogin < Minitest::Test
    
    def setup
        @login = Login.new
    end
    
    def test_title_is_login
        assert_equal 'Login', @login.title
    end
    
end
    
    

