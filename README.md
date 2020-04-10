# sinatra-final-project
IC Sentiment Tracking Tool

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