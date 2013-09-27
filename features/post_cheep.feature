Feature: Post a cheep
  In order to be fulfilled
  As a trendy Maker
  I want to cheep

  Scenario: only when logged in
    Given I am on the homepage
    Then I should not see "Cheep!"

  Scenario: by visiting the new cheep page
    Given I am logged in
    When I follow "Cheep!"
    Then I should be on the new cheep page
    And I should see "Add a cheep!"

  Scenario: with a new cheep-tastic message
    Given I am logged in
    And I am on the new cheep page
    When I fill out the new cheep form with a cheep-tastic message
    Then I should be on the homepage
    And I should see my cheep-tastic cheep