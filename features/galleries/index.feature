Feature:
Background:
Given a gallery: "open" exists with title: "Opening Day", description: "There were many customers."
And an event exists
And a gallery: "akiko" exists with title: "Akiko's Birthday", event: that event

Scenario: View of gallery index for anonymous
When I go to the galleries page
Then I should see "Opening Day" and "There were many customers." within the first "galleries" listing
And I should see an "Event" link within the second "galleries" listing
But I should see no "Event" link within the first "galleries" listing
And I should see no links at the bottom of the page
And I should see no "Edit" nor "Del" link within the first "galleries" listing 

@listing @links
Scenario Outline: Links within the first listing for anyone
When I go to the galleries page
And I follow "<lnk>" within the second "galleries" listing
Then I should be on <path> page
Examples:
| lnk              | path             |
| Akiko's Birthday | gallery: "akiko" |
| Event            | that event       |

Scenario Outline: Links for mama within a gallery
Given I am logged in as mama
When I go to the galleries page
And I follow "<lnk>" within the first "galleries" listing
Then I should be on <path> page
And <no> galleries should exist
Examples:
| lnk  | path                   | no |
| Edit | gallery: "open"'s edit |  2 |
| Del  | the galleries          |  1 |

Scenario: Links for mama at the bottom of the page
Given I am logged in as mama
When I go to the galleries page
And I follow "New Gallery"
Then I should be on the new gallery page

Scenario: Deletion of a gallery should delete its pictures but not the event
Given I am logged in as mama
And a picture exists with gallery: gallery "akiko"
When I go to the galleries page
And I follow "Del" within the second "galleries" listing
Then 1 galleries should exist
And 1 events should exist
And 0 pictures should exist
