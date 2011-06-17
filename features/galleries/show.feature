Feature:
Background:
Given I am logged in as mama
And a gallery exists

Scenario: Picture links
Given a picture exists with caption: "Rails logo", file: "rails.png*", gallery: that gallery
When I go to that gallery page
And I click the image "Thumb_rails"
#Then I should be on that gallery's picture page

Scenario: Picture layout
Given a picture exists with caption: "Rails logo", file: "rails.png*", gallery: that gallery
When I go to that gallery page
Then I should see a "Thumb_rails" image link 
And I should see a "Rails logo" tooltip  
 
Scenario: Links for mama
When I go to that gallery page
And I follow "Add Picture" at the bottom of the page
Then I should be on that gallery's new picture page

@javascript
Scenario: Delete a picture
Given a picture exists with caption: "Rails logo", file: "rails.png*", gallery: that gallery
And I am logged in as mama
When I go to that gallery page
And I follow "Delete" and press "OK"
Then 0 pictures should exist
 
Scenario: Links for mama
When I go to that gallery page
And I follow "Add Picture" at the bottom of the page
Then I should be on that gallery's new picture page
