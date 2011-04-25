Feature: Root page

Scenario: Listing of events
Given an event exists with start_date: "2011-4-25", name: "Wow!", content: "This is a nice post."
When I go to the welcome page
Then I should see "Wow!" within the first "news_flow" listing
And I should see "4月25日" within the first "news_flow" listing
And I should see "This is a nice post." within the first "news_flow" listing

Scenario: Link within event
Given an event exists
When I go to the welcome page
When I follow "つづく"
Then I should be on that event page
