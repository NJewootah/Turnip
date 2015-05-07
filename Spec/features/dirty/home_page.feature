@home_page
Feature: Home Page

  Scenario: Should allow users to see their friend's status
    Given I am logged in as Neermal
    When I am on the home page
    Then I should see my friend's posted status
