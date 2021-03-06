Feature: User Administration

To let users use the application
They should be able to
Create user accounts on the website

Scenario: Create a new user account and view the profile page
  Given that no user "testuser" exists
  When I create a new user "testuser" with password "testpassword" and email "testemail@mail.com"
  Then I should see it's "testuser" login and "testemail@mail.com" email
  Then I should not see "We couldn't set up that account."
  Then I should see "Welcome to the Sample Social Network!"

Scenario: Deny account creation if the user already exists
  Given that a user "testuser" with password "testpassword" and email "testemail@mail.com" exists
  Given that I am at the sign up page
  When I fill in "user_login" with "testuser"
  When I fill in "user_name" with "testuser"
  When I fill in "user_email" with "testemail@email.com"
  When I fill in "user_password" with "testpassword"
  When I fill in "user_password_confirmation" with "testpassword"
  When I press "Sign up"
  Then I should be at the failed sign up page
  Then I should see "There were problems with the following fields"

Scenario: Update user details for existing user
  Given that a user "testuser" with password "testpassword" and email "testemail@mail.com" exists
  Given that I am logged in as "testuser" with "testpassword"
  Given that I am at the testuser's edit profile page
  When I fill in "user_name" with "newtestuser"
  When I fill in "user_email" with "newtestemail@email.com"
  When I press "Update"
  Then I should see "Your profile was successfully updated"
  Then I should be at the testuser's profile page
  Then I should see "newtestuser"
  Then I should see "newtestemail@email.com"