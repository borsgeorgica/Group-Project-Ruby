Feature: panel

    Scenario: panel page
    Given I am on the panelpage
    Then I should see " Welcome [name] to your Spicy Slice Panel! You will be able to access all your information as well as orders and menu from within this panel. Order now, you are only a tweet away!"
    Then I should see "How do i order?"
    Then I should see " Spicy slice is a restaurant based on a twitter ordering system which is one of its kind. We came up with this unique idea to allow customers to quickly order a pizza with the least possible problems!"
    #Then I should see "To make an order, you need to go to twitter and tweet in the following format @spicyslice [size] [pizza type] #order. For example @spicyslice Large Tomato & Cheese Pizza #order"
    Then I should see "You have 200 Points in your account!" within "#panel-order h3"
    Then I should see "For every 200 Points you get a free pizza!"
    Then I should see "Have you hit 200 Points? Simply tweet @Spicy_Slice23 [size] [pizza type] [200] #order to get a free pizza!"
    Then I should see "My Orders"
    Then I should see "Ordered via twitter? Great! you will find details on your order below. If it has been accepted by us or rejected due to location."
    Then I should see "Don't forget to order correcty!"
    Then I should see "You do not have any orders yet! Go on to twitter and order!"
    Then I should see "Diamond"
    Then I should see "Sheffield"
    Then I should see "info@spicyslice.com support@spicyslice.com"
    Then I should see "Phone"
    Then I should see "+44-123-456-789 +44-123-456-777"
    