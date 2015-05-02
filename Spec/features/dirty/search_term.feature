Feature: Search Term

	@search_term
  Scenario: Should allow users to search for videos
    Given I am logged in
    When I search for Ruby
    Then I should see a list of results relevant to Ruby