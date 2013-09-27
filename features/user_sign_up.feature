Feature: User signs up
  In order to use Chitter 
  As a trendy Maker
  I want to be the first person to sign up

  Scenario: by visiting the sign up page
    Given I am on the homepage
    When I follow "Sign up"
    Then I should be on the sign up page
    And I should see "Please sign up"

  Scenario: with correct details
    Given I am on the sign up page
    When I fill in the sign up form with my details
    Then I should be on the homepage
    And I should see my welcome message
    And I should have 1 user