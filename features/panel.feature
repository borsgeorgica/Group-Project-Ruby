Feature: panel

    Scenario: panel page
    Given I am on the loginpage
    When I fill in "username" with "zilongtian"
    When I fill in "password" with "123456"
    When I press "login_button" within "form"
    Then I should be on the panelpage
    Then I should see "Welcome" within "#panel-welcome"
    Then I should see "Welcome zilongtian to your Spicy Slice Panel! You will be able to access all your information as well as orders and menu from within this panel. Order now, you are only a tweet away!" within "#panel-welcome h3"
    Then I should see "How do i order?" within "#panel-order h2"
    Then I should see "Spicy slice is a restaurant based on a twitter ordering system which is one of its kind. We came up with this unique idea to allow customers to quickly order a pizza with the least possible problems!"
    Then I should see "You have 200 Points in your account!" within "#panel-order h3"
    Then I should see "For every 200 Points you get a free pizza!"
<<<<<<< HEAD
    Then I should see "Have you hit 200 Points? Simply tweet @Spicy_Slice23 [size] [pizza type] [200] #order to get a free pizza!"
=======
>>>>>>> ee1c91a2f581220232f4a5b7f20cf8aac8e39f61
    Then I should see "My Orders"
    Then I should see "Ordered via twitter? Great! you will find details on your order below. If it has been accepted by us or rejected due to location."
    Then I should see "Don't forget to order correcty!"
    Then I should see "You do not have any orders yet! Go on to twitter and order!"
    Then I should see "Diamond"
    Then I should see "Sheffield"
    Then I should see "info@spicyslice.com support@spicyslice.com"
    Then I should see "Phone"
    Then I should see "+44-123-456-789 +44-123-456-777"
    