Feature:
Background:
Given an event exists

Scenario: Event view
When I go to that event page
Then I should see links "All Events" at the top of the page
But I should see no "thumbs" section

Scenario: An event with an empty gallery displays no pictures
Given a gallery exists with event: that event
When I go to that event page
Then I should see a "thumbs" section
And I should see a "Gallery" link

@pictures
Scenario: An event with gallery & pictures displays some pictures
Given a gallery exists with event: that event
And a picture exists with gallery: that gallery, file: "rails.png*"
When I go to that event page
Then I should see a "thumbs" section
And I should see no "Thumb_rails" image link
But I should see a "a big boat" tooltip
But I should see a "Gallery" link
