How to start the project running on sinatra


in terminal
1) go to that directory
2) type dbtravel >>> in this case the database's name is travel.
3) type psql -d travel -f db/travel.sql >>> -d is database which is travel in this case. -f is the file name which is travel.sql but is in db folder so the path is db/travel.sql. But remember you need to be already in project_travel_bucket folder.
4) once it's ready then run your seed.rb file by "ruby seed.rb"
it will display pry.. and then by typing city_1 or country_2 or city_1.find_country or any method you call on any class object would display the answer.
5) finally to run your sinatra (controller) type ruby travel_controller.rb. once controller starts, you will be able to see the localhost number like 4567 or anything that it says then as your computer has your server (so it is local).
6) on google in the search box type localhost4567/travel would display the website you built.







Travel Bucket List

Build an app to track someone's travel adventures.

MVP:

The app should allow the user to track countries and cities they want to visit and those they have visited.
The user should be able to create, edit and delete countries
Each country should have one or more cities to visit
The user should be able to create, edit and delete cities
The app should allow the user to mark destinations as visited or still to see
User Stories / Acceptance Criteria - MVP

Manage Countries

As a user
I want to be able to keep track of the countries which contain cities I want to visit
So that I can keep the information up to date

Acceptance Criteria: Users should be able to add countries to the list of countries
Acceptance Criteria: Users should be able to edit countries in the list of countries
Acceptance Criteria: Users should be able to delete countries from the list of countries

Manage Destinations

As a user
I want to be able to keep track of the destinations in a particular country which I want to visit and have already visited
So that I can see which destinations I have already visited and have still to visit

Acceptance Criteria: Users should be able to add visits to a particular country
Acceptance Criteria: Users should be able to see all the cities in a particular country and whether or not they have been visited
Acceptance Criteria: Users should be able to edit destinations in the list of destinations
Acceptance Criteria: Users should be able to delete destinations from a particular country
Acceptance Criteria: Users should be able to mark destinations as visited or still to visit

Possible Extensions (Create your own user stories for these)

Have separate pages for destinations visited and those still to visit
Add sights to the destination cities
Search for destination by continent, city or country
Any other ideas you might come up with
