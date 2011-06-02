Feature:

Scenario Outline: Sidebar check
Given I go to the welcome page
And I follow "<lnk>" within the "side_bar" section
Then I should be on the <path> page
Examples:
| lnk     | path      |
| Events  | events    |
| Gallery | galleries |
