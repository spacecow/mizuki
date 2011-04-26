Feature:
Background:
Given I am logged in as mama
And a gallery exists

Scenario: Links for mama
When I go to that gallery page
And I follow "Add Picture" at the bottom of the page
Then I should be on that gallery's new picture page
