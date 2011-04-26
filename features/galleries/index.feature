Feature:

Scenario: View of gallery index
Given a gallery exists with title: "Opening Day", description: "There were many customers."
When I go to the galleries page
Then I should see "Opening Day" within the first "galleries" listing
And I should see "There were many customers." within the first "galleries" listing

Scenario: Links for mama
Given a user exists with roles_mask: 2
And I am logged in as that user
When I go to the galleries page
And I follow "New Gallery"
Then I should be on the new gallery page
