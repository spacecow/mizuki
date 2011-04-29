Feature:
Background:
Given an event: "open" exists with name: "Shop Open", start_date: "2011-4-29"
And an event: "akiko" exists with name: "Akiko's Birthday", start_date: "2011-5-1" 
And a gallery exists with event: event "akiko"

@list
Scenario: Event listing
When I go to the events page
Then I should see "Akiko's Birthday" and "5月1日" within the first "events" listing
And I should see a "Gallery" link within the first "events" listing
But I should see no "Gallery" link within the second "events" listing
And I should see no "Edit" nor "Del" link within the second "events" listing
And I should see no links at the bottom of the page

Scenario Outline: Links within the first listing for anyone
When I go to the events page
And I follow "<lnk>" within the first "events" listing
Then I should be on <path> page
Examples:
| lnk              | path           |
| Akiko's Birthday | event: "akiko" |
| Gallery          | that gallery   |

Scenario Outline: Links within the first listing for mama
Given I am logged in as mama
When I go to the events page
And I follow "<lnk>" within the second "events" listing
Then I should be on <path> page
And <no> events should exist
Examples:
| lnk  | path                 | no |
| Edit | event: "open"'s edit |  2 |
| Del  | the events           |  1 |

Scenario: Links on the bottom of the page for mama
Given I am logged in as mama
When I go to the events page
And I follow "New Event" at the bottom of the page
Then I should be on the new event page

Scenario: Deletion of a gallery should delete its pictures but not the event
Given I am logged in as mama
When I go to the events page
And I follow "Del" within the first "events" listing
Then 1 events should exist
And 1 galleries should exist
