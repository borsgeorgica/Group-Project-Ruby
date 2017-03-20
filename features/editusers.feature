Feature: editusers

    Scenario: editusers page
    Given I am on the edituserspage
    When I fill in "tusername" with "secret"
    When I fill in "name" with "text"
    When I fill in "surname" with "text"
    When I fill in "email" with "email"
    When I fill in "number" with "tel"
    When I fill in "postcode" with "postcode"
    When I fill in "address" with "address"
    When I press "Submit" within "form"
    Then I should be on the adminpage