Feature:

Scenario: Default if there are no tweets
When I go to the welcome page
Then I should see "default tweet" and "never" within the "tweet container" section

Scenario: Show the last tweet
Given a tweet exists with content: "oh yeah"
When I go to the welcome page
Then I should see "oh yeah" but no "default tweet" within the "tweet container" section
And I should see "less than a minute ago" but no "never" within the "tweet container" section
