Feature:
Background:
Given a user exists with roles_mask: 1
And I am logged in as that user
Given a maintenance exists with ip: "127.0.0.1", place: "local"

Scenario: View maintenance
When I go to the maintenances page
Then I should see "127.0.0.1" and "local" within the first table row
And I should see links "Edit, Del" within the first table row

Scenario Outline: Follow links within a maintenance
When I go to the maintenances page
And I follow "<link>" within the first table row
Then I should be on <path> page
And <no> maintenances should exist
Examples:
| link | path                  | no |
| Edit | that maintenance edit |  1 |
| Del  | the maintenances      |  0 |
