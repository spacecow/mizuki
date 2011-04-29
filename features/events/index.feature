Feature:
Background:
Given an event exists with name: "Shop Open", start_date: "2011-4-29"
And an event exists with name: "Akiko's Birthday", start_date: "2011-5-1" 

Scenario: Event listing
When I go to the events page
Then I should see "Akiko's Birthday" within the first "events" listing
