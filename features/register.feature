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
    Then I should be on the registerpage
    
    Scenario: error 
    Given I am on the registerpage
    When I fill in "username" with "nonsense"
    When I fill in "name" with "nonsense"
    When I fill in "surname" with "nonsense"
    When I fill in "email" with "nonsense"
    When I fill in "number" with "nonsense"
    When I fill in "postcode" with "nonsense"
    When I press "Register" within "form"
    Then I should see "Please check one or more values again"
    
    Scenario: empty page
    Given I am on the registerpage
    When I press "Register" within "form"
    Then I should see "Please check one or more values again"
    
    Scenario: location selection
    Given I am on the registerpage
    When I select "Location" from "location"
    Then I should see "London"
    Then I should see "Sheffield"
    When I select "London" from "location"
    Then I should see "London"
    Then I should be on the registerpages
    