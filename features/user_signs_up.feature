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

  @javascript
  Scenario: with correct details (using Ajax)
    Given I am on the homepage
    When I follow "Sign up"
    And I fill in the sign up form with correct details
    Then I should be logged in
    And there should be 1 user

  Scenario: with passwords that don't match
    Given I am on the sign up page
    When I fill in the sign up form with passwords that don't match
    Then I should be on the sign up page
    And I should see a passwords don't match message

  Scenario: with an email address in the wrong format
    Given I am on the sign up page
    When I fill in "email address" for "email"
    And I press "Sign up"
    Then I should be on the sign up page
    And I should see "Please check your email address is typed correctly"

  Scenario: with no details
    Given I am on the sign up page
    When I press "Sign up"
    Then I should be on the sign up page
    And I should see an incomplete details message

  Scenario: with details that have already been registered
    Given I have signed up
    And I am on the sign up page
    When I fill in the sign up form with correct details
    Then I should be on the sign up page
    And I should see an invalid sign up message

  Scenario: when already logged in
    Given I am logged in
    And I am on the sign up page
    When I fill in the sign up form with correct details
    Then I should be on the homepage
    And I should see an already logged in message