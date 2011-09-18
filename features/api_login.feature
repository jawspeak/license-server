Feature: Log in by the api
  In order to let a thick client application verify the user paid to use all of the features
  Users should be able to log into the license server with username and password

  Scenario: Successfully log in
    Given that there is a user "steve@example.com" with a password "pass123"
    When I log in by the api
    Then I should get back "OK"