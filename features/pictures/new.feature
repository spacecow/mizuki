Feature:
Background:
Given I am logged in as mama
And a gallery exists

Scenario: Upload a new picture
When I go to that gallery's new picture page
And I fill in "Caption" with "A new picture"
And I attach the file "features/rails.png" to "File"
And I press "Add Picture"
Then a picture should exist with caption: "A new picture", file: "rails.png", gallery: that gallery
And 1 pictures should exist
And I should see "Successfully added picture." as notice flash message
