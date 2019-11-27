# week5_project_travel_server
https://learn.co/lessons/sinatra-restful-routes-readme 
Country and cities have one to many relationship. 


How to start the project running on sinatra
in terminal
go to that directory
type dbtravel >>> in this case the database's name is travel.
type psql -d travel -f db/travel.sql >>> -d is database which is travel in this case. -f is the file name which is travel.sql but is in db folder so the path is db/travel.sql. But remember you need to be already in project_travel_bucket folder.
once it's ready then run your seed.rb file by "ruby seed.rb" it will display pry.. and then by typing city_1 or country_2 or city_1.find_country or any method you call on any class object would display the answer.
finally to run your sinatra (controller) type ruby travel_controller.rb. once controller starts, you will be able to see the localhost number like 4567 or anything that it says then as your computer has your server (so it is local).
on google in the search box type localhost4567/travel would display the website you built.

Travel Bucket List
This app tracks user's travel adventures.
MVP:
The app allows the user to track countries and cities they want to visit and those they have visited. The user can create, edit and delete countries Each country have one or more cities to visit The user is able to create, edit and delete cities The app allows the user to mark destinations as visited or still to visit. 
Have separate pages for destinations visited and those still to visit.
