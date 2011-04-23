Feature:
Background:
Given a user exists with username: "test", password: "secret"

Scenario: Log in
Given I go to the login page
And I fill in "Username" with "test"
And I fill in "Password" with "secret"
And I press "Log in"
Then I should see "Welcome test"

Scenario: A maintenance should not be created
Given I am logged in as that user
Then 0 maintenances should exist
