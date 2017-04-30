Feature: Admin nav
    
    Scenario: At the admin page
        Given I am on the adminpage
        When I click on "Admin Home"
        Then I should be on the adminpage
        When I click on "Accepted Orders"
        Then I should be on the acceptedpage
        When I click on "Twitter Panel"
        Then I should be on the twitterpage
        When I click on "Users"
        Then I should be on the userspage
        When I click on "Settings"
        Then I should be on the settingspage
    
    Scenario: logging out 
        Given I am on the adminpage
        When I click on "Logout"
        Then I should be on the loginpage