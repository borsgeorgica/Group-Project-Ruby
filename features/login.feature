Feature: login
    
  Scenario: Correct password
    Given I am on the loginpage
    When I fill in "username" with "secret"
    When I fill in "password" with "secret"
    When I press "login_button" within "form"
    Then I should see "Welcome"
    Then I should be on the panelpage
    
  Scenario: Incorrect password
    Given I am on the loginpage
    When I fill in "username" with "secret"
    When I fill in "password" with "nonsense"
    When I press "login_button" within "form"
    Then I should see "You have entered an incorrect username/password. Please try again"
    Then I should be on the loginpage
   
    
    
      