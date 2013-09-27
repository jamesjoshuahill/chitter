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
    When I fill in the sign up form with correct details
    Then I should be logged in
    And there should be 1 user

  Scenario: with passwords that don't match
    Given I am on the sign up page
    When I fill in the sign up form with passwords that don't match
    Then I should be on the sign up page
    And I should see a passwords don't match message

  Scenario: with details that have already been registered
    Given I have signed up
    And I am on the sign up page
    When I fill in the sign up form with correct details
    Then I should be on the sign up page
    And I should see an invalid sign up message