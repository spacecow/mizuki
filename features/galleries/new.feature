Feature:
Background:
Given I am logged in as mama

Scenario: Create a new gallery
When I go to the new gallery page
And I fill in "Title" with "A new gallery"
And I fill in "Description" with "Description of the new gallery."
And I press "Create Gallery"
Then a gallery should exist with title: "A new gallery", description: "Description of the new gallery."
And 1 galleries should exist
And I should see "Successfully created gallery." as notice flash message
And I should be on the galleries page

Scenario: The gallery title must be unique
Given a gallery exists with title: "Unique title"
When I go to the new gallery page
And I fill in "Title" with "Unique title"
And I press "Create Gallery"
Then I should see a gallery title error: taken

