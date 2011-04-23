Feature:
Background:
Given a maintenance exists with ip: "127.0.0.1", place: "local"
And a user exists with roles_mask: 3
And I am logged in as that user
When I go to that maintenance edit page

Scenario: Edit maintenance view
Then the "IP" field should contain "127.0.0.1"
And the "Place" field should contain "local"

Scenario: Edit a maintenance
When I fill in "IP" with "192.168.0.2"
And I fill in "Place" with "still local"
And I press "Update"
Then a maintenance should exist with ip: "192.168.0.2", place: "still local"
And 1 maintenances should exist
And I should see "Successfully updated maintenance." as notice flash message
And I should be on the maintenances page

Scenario Outline: Follow links at the bottom of the page
When I follow "<lnk>" at the bottom of the page
Then I should be on <path> page
And <no> maintenances should exist
Examples:
| lnk      | path             | no |
| Delete   | the maintenances |  0 |
| View All | the maintenances |  1 |
