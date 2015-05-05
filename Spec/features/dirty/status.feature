Feature: Status

  @status
  Scenario: Should allow users to create their status
    Given I am logged in as Nini
    When I create my status
    Then my friends should see my created status on their homepage
    