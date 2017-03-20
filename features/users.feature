Feature: users

    Scenario: users page
    Given I am on the userspage
    Then I should see "User List!"
    Then I should see "Here you can find a list of all the users who have registered on this website!"
    When I fill in "search" with "text"
   