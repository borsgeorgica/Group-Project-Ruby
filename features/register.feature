Feature: register
    
    Scenario: On register page
    Given I am on the registerpage
    Then I should see "Register" within "h2"
    
    Scenario: Register
    Given I am on the registerpage
    When I fill in "username" with "zilongtian"
    When I fill in "name" with "zilong"
    When I fill in "surname" with "tian"
    When I fill in "email" with "ztian10@sheffield.ac.uk"
    When I fill in "password" with "123456"
    When I fill in "number" with "0000055554444"
    When I fill in "postcode" with "s2 5df"
    When I fill in "address" with "80 Hoyle Street"
    When I press "Register" within "form"
    Then I should be on the loginpage
    
    Scenario: Register again with same details
    Given I am on the registerpage
    When I fill in "username" with "zilongtian"
    When I fill in "name" with "zilong"
    When I fill in "surname" with "tian"
    When I fill in "email" with "ztian10@sheffield.ac.uk"
    When I fill in "password" with "123456"
    When I fill in "number" with "0000055554444"
    When I fill in "postcode" with "s2 5df"
    When I select "Sheffield" from "location"
    When I fill in "address" with "80 Hoyle Street"
    When I press "Register" within "form"
    Then I should be on the registerpage
    
    Scenario: Filling in the register form with nonsense information
    Given I am on the registerpage
    When I fill in "username" with "dawdwa"
    When I fill in "name" with "dwad"
    When I fill in "surname" with "awdwa"
    When I fill in "email" with "awdaw"
    When I fill in "number" with "dawdwa"
    When I fill in "postcode" with "dawdwa"
    When I fill in "address" with "dwadwadw"
    When I press "Register" within "form"
    Then I should see "Please check one or more values again"
    Then I should be on the registerpage
    
    Scenario: empty page
    Given I am on the registerpage
    When I press "Register" within "form"
    Then I should see "Please check one or more values again"
    Then I should be on the registerpage
    
    Scenario: location selection
    Given I am on the registerpage
    When I select "Location" from "location"
    Then I should see "London"
    Then I should see "Sheffield"
    When I select "London" from "location"
    Then I should see "London"
    Then I should be on the registerpages
    