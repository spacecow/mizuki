Feature:
Background:
Given I am logged in as mama
And a gallery exists

Scenario: Picture links
Given a picture exists with caption: "Rails logo", file: "rails.png*", gallery: that gallery
When I go to that gallery page
And I click the image "Rails"
Then I should be on that gallery's picture page

Scenario: Picture layout
Given a picture exists with caption: "Rails logo", file: "rails.png*", gallery: that gallery
When I go to that gallery page

Scenario: Links for mama
When I go to that gallery page
And I follow "Add Picture" at the bottom of the page
Then I should be on that gallery's new picture page
