Feature:

Scenario: View of gallery index
Given a gallery exists with title: "Opening Day", description: "There were many customers."
When I go to the galleries page
Then I should see "Opening Day" within the first "galleries" listing
And I should see "There were many customers." within the first "galleries" listing

Scenario: Links within a gallery
Given a gallery exists with title: "Test Gallery"
When I go to the galleries page
And I follow "Test Gallery" within the first "galleries" listing
Then I should be on that gallery page

Scenario Outline: Links for mama within a gallery
Given I am logged in as mama
And a gallery exists with title: "Test Gallery"
When I go to the galleries page
And I follow "<lnk>" within the first "galleries" listing
Then I should be on <path> page
And <no> galleries should exist
Examples:
| lnk  | path                | no |
| Edit | that gallery's edit |  1 |
| Del  | the galleries       |  0 |

Scenario: Links for mama at the bottom of the page
Given I am logged in as mama
When I go to the galleries page
And I follow "New Gallery"
Then I should be on the new gallery page
