require "minitest/autorun"
require_relative "./twitter"
require_relative "./register"

class TestTwitterInteract < Minitest::Test
    
    def setup
        @twitter = TwitterInteract.new
    end
    
    def test_title_is_tweet_to_order
        assert_equal 'Tweet to order', @twitter.title
    end
    
    def test_find_tweets
        assert_equal "User is: #{tweet.user.screen_name}", @twitter.find_tweets(keywords)
    end
   
    def test_confirmation_tweet
        assert_equal @client.update("@#{username} Please confirm your order"), @twitter.send_confirmation_tweet
    end
end

class TestRegister < Minitest::Test
    
    def setup
        @register = Register.new
    end
    
    def test_title_is_register
        assert_equal 'Register', @register.title
    end
    
    def test_register_user
        assert_equal 'SELECT COUNT(*) FROM personal_details WHERE email = ?', @register.register_user(db, username, name, surname, email, password, contact_number,storelocation, address)
    end
    
end
    
    

