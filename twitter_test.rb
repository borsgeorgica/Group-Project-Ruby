require "minitest/autorun"
require_relative "./twitter"

class TestTwitterInteract < Minitest::Test
    
    def setup
        @twitter = TwitterInteract.new
    end
    
    def test_title_is_tweet
        assert_equal "Tweet to order", @twitter.title
    end
end
    