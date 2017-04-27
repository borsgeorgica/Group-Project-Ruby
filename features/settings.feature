Feature: settings

    Scenario: seting
    Given I am on the settingspage
    Then I should see "Account Settings" within "h2"
    When I fill in "email" with "email"
    When I fill in "password" with "secret"
    When I fill in "tel" with "tel"
    When I fill in "postcode" with "postcode"
    When I fill in "address" with "address"
    When I press "Update settings" within "form"
    Then I should be on the settingspage