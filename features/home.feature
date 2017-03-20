Feature: homepage

    Scenario: on home page
    Given I am on the homepage
    Then I should see "WELCOME TO SPICY SLICE!" within "#intro"
    Then I should see "FOR THE BEST PIZZAS" within "#intro"
    Then I should see "FOR THE FIRST TIME EVER" within "#intro"
    Then I should see "ORDER PIZZAS FROM TWITTER!" within "#intro"