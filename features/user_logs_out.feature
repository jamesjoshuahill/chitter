Feature: User logs out
  In order to stop others using my Chitter account
  As a trendy Maker
  I want to log out

  Scenario: when logged in
    Given I am logged in
    When I press "Log out"
    Then I should be logged out

  Scenario: when not logged in
    Given I am on the homepage
    Then I should not see "Log out"