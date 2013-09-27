Feature: User sign up
  In order to use Chitter 
  As a maker
  I want to sign up to the service

  Scenario: When I have not signed up
    Given I am on the homepage
    When I follow "Sign up"
    Then I should be on the sign up page
    And I should see "Please sign up"