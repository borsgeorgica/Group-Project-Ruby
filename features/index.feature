Feature: homepage

    Scenario: on index page
    Given I am on the indexpage
    Then I should see "WELCOME TO SPICY SLICE!" within "#intro"
    Then I should see "FOR THE BEST PIZZAS" within "#intro"
    Then I should see "FOR THE FIRST TIME EVER" within "#intro"
    Then I should see "ORDER PIZZAS FROM TWITTER!" within "#intro"
    
    Scenario: clicking on menu
    Given I am on the indexpage
    When I click on "Home" within "nav"
    Then I should be on the indexpage
    When I click on "Login" within "nav"
    Then I should go to the loginpage