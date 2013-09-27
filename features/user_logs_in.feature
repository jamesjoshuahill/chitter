Feature: User logs in
  In order to use Chitter
  As a trendy Maker
  I want to log in

  Scenario: by visiting the log in page
    Given I am on the homepage
    When I follow "Log in"
    Then I should be on the log in page
    And I should see "Please log in"

  Scenario: with correct details
    Given I have signed up
    And I am on the log in page
    When I fill in the log in form with correct details
    Then I should be logged in