Feature: nav bar

    Scenario:Going to other pages from main page
        Given I am on the indexpage
        When I click on "Home" within "#homepage"
        Then I should be on the indexpage
        When I click on "Register"
        Then I should be on the registerpage
        When I click on "Menu"
        Then I should be on the indexpage
        When I click on "Login"
        Then I should be on the loginpage
        When I click on "Order"
        Then I should be on the indexpage
        When I click on "About us"
        Then I should be on the indexpage
        When I click on "Contact Us"
        Then I should be on the indexpage
     
    Scenario:Going to other pages from register page
        Given I am on the registerpage
        When I click on "Home" within "#homepage"
        Then I should be on the indexpage
        When I click on "Menu"
        Then I should be on the indexpage
        When I click on "Login"
        Then I should be on the loginpage
        When I click on "Order"
        Then I should be on the indexpage
        When I click on "About us"
        Then I should be on the indexpage
        When I click on "Contact Us"
        Then I should be on the indexpage
        When I click on "Register"
        Then I should be on the registerpage
     
    Scenario:Going to other pages from login pages
        Given I am on the loginpage
        When I click on "Home" within "#homepage"
        Then I should be on the indexpage
        When I click on "Menu"
        Then I should be on the indexpage
        When I click on "About us"
        Then I should be on the indexpage
        When I click on "Contact Us"
        Then I should be on the indexpage
        When I click on "Register"
        Then I should be on the registerpage
        When I click on "Login"
        Then I should be on the loginpage
        When I click on "Order"
                                 
    Scenario: Click on the logo and seeing logo
        Given I am on the indexpage
        When I click on image "Logo"
        Then I should be on the indexpage