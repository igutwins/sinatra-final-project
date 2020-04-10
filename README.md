# sinatra-final-project
IC Sentiment Tracking Tool

To run this program, clone and download the repository, run "bundle install" in your terminal, and use "shotgun" to view the app on localhost:9393. 

Purpose: 

For Investment Committee members at a Private Equity firm to document their views on an investment's merits. 

Implementation:

Users (Investment Committee Members) sign up to the app with their company email and have access to a list of investments ("Deals") requiring evaluation.
Users fill out and submit an evaluation form unique to them for a particular deal. Users can edit the forms they have previously filled out, but cannot add 
or delete deals. 

Only the administrator can add or delete deals. In this implementation, user "igutwins" (me) is the only one who can add or delete deals. In practice, this 
woudl be the chair of the Investment Committee. 

Seed Data:

The database is seeded with ten deals requiring evaluation, and 2 users, joanne and igutwins. As mentioned above, igutwins is the admin user and joanne is a 
regular user without special permissions. Both passwords are set to "password" so Flatiron instructors can use the program and the administrator functionality.

Model Relationships:

This app uses three models: (1) Users, (2) Scorecards, and (3) Deals. Their interrelationships are as follows:

    1) A User has_many Scorecards and has_many Deals through Scorecards.
    2) A Scorecard belongs_to a User and belongs_to a Deal.
    3) A Deal has_many Scorecards and has_many Users through Scorecards.

These relationships exist because all Investment Committee members ("Users") would be required to evaluate each investment ("Deal") proposed. Further, many
Deals are evaluated over time, each requiring a Scorecard to be filled in by each User.  

The gem is available as open source under the terms of the MIT License.