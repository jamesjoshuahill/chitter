Feature: List cheeps
  In order to see what all the trendy Makers think
  As a trendy Maker
  I want to see all the cheeps from latest to oldest

  Scenario: by visiting Chitter
    Given there are a few cheeps
    And I am on the homepage
    Then I should see the few cheeps in chronological order