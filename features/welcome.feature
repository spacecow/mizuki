Feature: Root page

Scenario: Listing of events
Given an event exists with start_date: "2011-4-25"
When I go to the welcome page
Then I should see "4月25日" within the first event listing
