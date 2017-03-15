Feature: login

    Scenario: Correct password entered
        Given I am on the login page
        When I fill in password with "secret"
        When I press "submit" within "form"
        Then I should see "Welcome"
        Then I should see "You logged into the members area"
        
    Scenario: Wrong password entered
        Given I am on the login page
        When I fill in password with "nonsense"
        When I press "submit" within "form"
        Then I should see "Login"
        Then I should see "Password incorrect"