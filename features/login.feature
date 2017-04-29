Feature: login
    
  Scenario: Correct password
    Given I am on the loginpage
    When I fill in "username" with "zilongtian"
    When I fill in "password" with "123456"
    When I press "login_button" within "form"
    Then I should be on the panelpage
    
  Scenario: Incorrect password
    Given I am on the loginpage
    When I fill in "username" with "zilongtian"
    When I fill in "password" with "12345678"
    When I press "login_button" within "form"
    Then I should see "You have entered an incorrect username/password. Please try again"
    Then I should be on the loginpage
    
  Scenario: Incorrect username
    Given I am on the loginpage
    When I fill in "username" with "zilongtian1"
    When I fill in "password" with "123456"
    When I press "login_button" within "form"
    Then I should see "You have entered an incorrect username/password. Please try again"
    Then I should be on the loginpage
    
  Scenario: Empty username
    Given I am on the loginpage
    When I fill in "username" with "   "
    When I press "login_button" within "form"
    Then I should see "You have entered an incorrect username/password. Please try again"
    Then I should be on the loginpage
    
  Scenario: Empty password
    Given I am on the loginpage
    When I fill in "username" with "zilongtian"
    When I press "login_button" within "form"
    Then I should see "You have entered an incorrect username/password. Please try again"
    Then I should be on the loginpage
   
    
    
      