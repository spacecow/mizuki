Feature:
Background:
Given a gallery exists with title: "Opening Day", description: "Lots of ppl."
And I am logged in as mama

Scenario: Edit gallery view
When I go to that gallery edit page
Then the "Title" field should contain "Opening Day"
And the "Description" field should contain "Lots of ppl."
And I should see links "Show, Delete, View Galleries" at the bottom of the page

Scenario Outline: Follow the links at the bottom of the page
When I go to that gallery edit page
And I follow "<link>" at the bottom of the page
Then I should be on <path> page
And <no> galleries should exist
Examples:
| link           | path          | no |
| Show           | that gallery  |  1 |
| Delete         | the galleries |  0 |
| View Galleries | the galleries |  1 |

Scenario: Edit a gallery
When I go to that gallery edit page
And I fill in "Title" with "Another title"
And I fill in "Description" with "no ppl."
And I press "Update Gallery"
Then a gallery should exist with title: "Another title", description: "no ppl."
And 1 galleries should exist
And I should see "Successfully updated gallery." as notice flash message
And I should be on the galleries page

Scenario: A gallery must have a title
When I go to that gallery edit page
And I fill in "Title" with ""
And I press "Update Gallery"
Then I should see a gallery title error: blank

@pending
Scenario: Should be able to choose event
