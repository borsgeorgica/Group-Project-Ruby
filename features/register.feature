Feature: register
    
    Scenario: Fill in register page
    Given I am on the registerpage
    Then I should see "Register" within "h2"
    When I fill in "username" with "secret"
    When I fill in "name" with "text"
    When I fill in "surname" with "text"
    When I fill in "email" with "email"
    When I fill in "password" with "secret"
    When I fill in "number" with "tel"
    When I fill in "postcode" with "postcode"
    When I fill in "address" with "address"
    When I press "Register" within "form"
    Then I should be on the loginpage

    