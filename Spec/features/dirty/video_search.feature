Feature: Video Search

  @wip
  Scenario: Should allow users to search for videos
    Given I am logged in
    When I search for Ruby
    Then I should see a list of results relevent to Ruby