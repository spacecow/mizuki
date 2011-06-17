Feature:
Background:
Given a gallery exists
And a picture exists with gallery: that gallery

Scenario Outline: Links for mama on the bottom of the page
Given I am logged in as mama
When I go to that gallery's picture page
And I follow "<lnk>" at the bottom of the page
Then I should be on that <path> page
And <no> pictures should exist
Examples:
| lnk    | path                     | no |
| Edit   | gallery's picture's edit |  1 |
| Delete | gallery                  |  0 |
