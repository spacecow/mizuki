Feature:
Background:
Given I am logged in as mama
And a gallery exists
And a picture exists with gallery: that gallery, caption: "A nice caption", file: "rails.png*"

Scenario: Edit picture view
When I go to that gallery's picture's edit page
Then the "Caption" field should contain "A nice caption"
And I should see "Uploaded file: rails.png"

Scenario: Edit a picture
When I go to that gallery's picture's edit page
And I fill in "Caption" with "Another caption"
And I attach the file "features/rails2.png" to "File"
And I press "Update Picture"
Then a picture should exist with caption: "Another caption", file: "rails2.png", gallery: that gallery
