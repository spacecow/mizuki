Feature:

Scenario: Mirror ip
When I go to the welcome page
Then a maintenance should exist with ip: "127.0.0.1", place: nil

Scenario: Mirror place
Given a maintenance exists with ip: "127.0.0.1", place: "local"
When I go to the welcome page
Then 2 maintenances should exist with ip: "127.0.0.1", place: "local"
