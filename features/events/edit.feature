Feature:
Background:
Given a user exists with roles_mask: 2
And I am logged in as that user
And an event exists with start_date: "2011-4-25", name: "Wow!", content: "This is a nice post."

Scenario: Edit an event
When I go to that event's edit page
And I fill in "Content" with "New content"
And I press "Update Event"
Then an event should exist with start_date: "2011-4-25", name: "Wow!", content: "New content"
