Feature:
Background:
Given an event: "open" exists with name: "Shop Open", start_date: "2011-4-29"
And an event exists with name: "Akiko's Birthday", start_date: "2011-5-1" 

Scenario: Event listing
When I go to the events page
Then I should see "Akiko's Birthday" and "5月1日" within the first "events" listing

Scenario Outline: Links within the first listing
When I go to the events page
And I follow "<lnk>" within the second "events" listing
Then I should be on <path> page
Examples:
| lnk       | path          |
| Shop Open | event: "open" |
