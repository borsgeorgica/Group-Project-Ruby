Feature: user nav

    Scenario: Going to other pages
        Given I am on the loginpage
        When I fill in "username" with "zilongtian"
        When I fill in "password" with "123456"
        When I press "Login" within "form"
        Then I should be on the panelpage
        When I click on "Panel Home"
        Then I should be on the panelpage
        When I click on "Order"
        Then I should be on the panelpage
        When I click on "My Orders"
        Then I should be on the panelpage
        When I click on "Account Settings"
        Then I should be on the settingspage
        When I click on "Logout"
        Then I should be on the loginpage
        
    Scenario: Clicking on the menu page
        Given I am on the loginpage
        When I fill in "username" with "zilongtian"
        When I fill in "password" with "123456"
        When I press "Login" within "form"
        Then I should be on the panelpage
        When I click on "Menu"
        Then I should be on the clientmenupage