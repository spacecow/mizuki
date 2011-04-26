Feature: Root page

Scenario: Listing of events
Given an event exists with start_date: "2011-4-25", name: "Wow!", content: "This is a nice post."
When I go to the welcome page
Then I should see "Wow!" within the first "news_flow" listing
And I should see "4月25日" within the first "news_flow" listing
And I should see "This is a nice post." within the first "news_flow" listing

Scenario Outline: Side bar links
When I go to the welcome page
And I follow "<lnk>" within the side bar section
Then I should be on <path> page
Examples:
| lnk     | path          |
| Events  | the welcome   |
| Gallery | the galleries |

Scenario: Link within event
Given an event exists
When I go to the welcome page
When I follow "つづく"
Then I should be on that event page

Scenario Outline: Link for mama
Given an event exists
And a user exists with roles_mask: 2
And I am logged in as that user
When I go to the welcome page
And I follow "<lnk>" within the first "news_flow" listing
Then I should be on <path> page
And <no> events should exist
Examples:
| lnk    | path              | no |
| Edit   | that event's edit | 1  |
| Delete | the events        | 0  |
