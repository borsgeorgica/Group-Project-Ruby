Feature: twitter

    Scenario: twitter page
    Given I am on the twitterpage
    Then I should see "Welcome to your twitter panel!" within "#AcceptOrder"
    Then I should see "All extra tweets shown below!"
    Then I should see "Competition tweets!"
    
    Scenario: tweets
    Given I am on the twitterpage
    When I fill in "tweet" with "cucumber testing"
    When I press "Tweet it!" within "form" 
    Then I should be on the twitterpage
    
    Scenario: clear tweet
    Given I am on the twitterpage
    When I press "Click to clear the competition log" within ".clearComp"
    
    Scenario: Competition
    Given I am on the twitterpage
    When I press "Click to Randomly choose a winner!" within ".competitionwin"