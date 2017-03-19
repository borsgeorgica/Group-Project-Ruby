Feature: login

  Scenario: home page
    Given I am on the homepage
    Then I should see "Home About us Menu Order Contact us Register Login"
    
  Scenario: Correct password
    Given I am on the loginpage
    When I fill in "username" with "secret"
    When I fill in "password" with "secret"
    When I press "submit" within "form"
    Then I should see "Welcome"
    
  Scenario: Incorrect password
    Given I am on the loginpage
    When I fill in "username" with "secret"
    When I fill in "password" with "nonsense"
    When I press "submit" within "form"
    Then I should see "Incorrect password"
   
  Scenario: Invalid username
    Given I am on the loginpage
    When I fill in "username" with "nonsense"
    Then I should see "Invalid username"
    
      