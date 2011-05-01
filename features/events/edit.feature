Feature:
Background:
Given I am logged in as mama
And an event exists with start_date: "2011-4-25", name: "Wow!", content: "This is a nice post."

Scenario: Edit an event
When I go to that event's edit page
And I fill in "Title" with "Edited event"
And I fill in "Description" with "New content"
And I press "Update Event"
Then an event should exist with start_date: "2011-4-25", name: "Edited event", content: "New content"
And 1 events should exist
And I should see "Successfully updated event." as notice flash message
And I should be on that event page

Scenario: Edit event view
When I go to that event's edit page
Then the "Title" field should contain "Wow!"
And the "Description" field should contain "This is a nice post."
And I should see links "Show, Delete, View Events" at the bottom of the page

Scenario Outline: Follow the links at the bottom of the page
When I go to that event's edit page
And I follow "<link>" at the bottom of the page
Then I should be on <path> page
And <no> events should exist
Examples:
| link        | path       | no |
| Delete      | the event  |  0 |
| View Events | the events |  1 |
#| Show        | that event |  1 |

Scenario: An event must have a title
When I go to that event's edit page
And I fill in "Title" with ""
And I press "Update Event"
Then I should see a event title error: blank
