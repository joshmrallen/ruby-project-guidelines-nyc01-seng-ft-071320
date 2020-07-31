# Module One Final Project Guidelines

Congratulations, you're at the end of module one! You've worked crazy hard to get here and have learned a ton.

For your final project, we'll be building a Command Line database application.

## Project Requirements

### Option One - Data Analytics Project

1. Access a Sqlite3 Database using ActiveRecord.
2. You should have at minimum three models including one join model. This means you must have a many-to-many relationship.
3. You should seed your database using data that you collect either from a CSV, a website by scraping, or an API.
4. Your models should have methods that answer interesting questions about the data. For example, if you've collected info about movie reviews, what is the most popular movie? What movie has the most reviews?
5. You should provide a CLI to display the return values of your interesting methods.  
6. Use good OO design patterns. You should have separate classes for your models and CLI interface.

  **Resource:** [Easy Access APIs](https://github.com/learn-co-curriculum/easy-access-apis)

### Option Two - Command Line CRUD App

1. Access a Sqlite3 Database using ActiveRecord.
2. You should have a minimum of three models.
3. You should build out a CLI to give your user full CRUD ability for at least one of your resources. For example, build out a command line To-Do list. A user should be able to create a new to-do, see all todos, update a todo item, and delete a todo. Todos can be grouped into categories, so that a to-do has many categories and categories have many to-dos.
4. Use good OO design patterns. You should have separate classes for your models and CLI interface.

### Brainstorming and Proposing a Project Idea

Projects need to be approved prior to launching into them, so take some time to brainstorm project options that will fulfill the requirements above.  You must have a minimum of four [user stories](https://en.wikipedia.org/wiki/User_story) to help explain how a user will interact with your app.  A user story should follow the general structure of `"As a <role>, I want <goal/desire> so that <benefit>"`. For example, if we were creating an app to randomly choose nearby restaurants on Yelp, we might write:

* As a user, I want to be able to enter my name to retrieve my records
* As a user, I want to enter a location and be given a random nearby restaurant suggestion
* As a user, I should be able to reject a suggestion and not see that restaurant suggestion again
* As a user, I want to be able to save to and retrieve a list of favorite restaurant suggestions

## Instructions

1. Fork and clone this repository.
2. Build your application. Make sure to commit early and commit often. Commit messages should be meaningful (clearly describe what you're doing in the commit) and accurate (there should be nothing in the commit that doesn't match the description in the commit message). Good rule of thumb is to commit every 3-7 mins of actual coding time. Most of your commits should have under 15 lines of code and a 2 line commit is perfectly acceptable.
3. Make sure to create a good README.md with a short description, install instructions, a contributor's guide and a link to the license for your code.
4. Make sure your project checks off each of the above requirements.
5. Prepare a video demo (narration helps!) describing how a user would interact with your working project.
    * The video should:
      - Have an overview of your project. (2 minutes max)
6. Prepare a presentation to follow your video. (3 minutes max)
    * Your presentation should:
      - Describe something you struggled to build, and show us how you ultimately implemented it in your code.
      - Discuss 3 things you learned in the process of working on this project.
      - Address what, if anything, you would change or add to what you have today.
      - Present any code you would like to highlight.   
7. *OPTIONAL, BUT RECOMMENDED*: Write a blog post about the project and process.


---
# Vacate: The Vacation Planner Tool
---
## Installation
1. Clone this repository: https://github.com/joshmrallen/ruby-project-guidelines-nyc01-seng-ft-071320
2. Add a file called api_key.rb to the /app/api directory.
3. 
4. Create two variables inside of api_key.rb
  * AMADEUS_CLIENT_ID
  * AMADEUS_CLIENT_SECRET
5. Either make an account on https://developers.amadeus.com/ or ask me for an api key
6. Set the client id variable equal to the api key.
7. Set the client secret variable to the client secet you obtain.
8. Open command line.
9. Type the following to run the application:
```
ruby bin/run.rb
```

## GNU General Public License
https://www.gnu.org/licenses/gpl-3.0.html

## User Stories

1. As a user, I want to be able to enter a city to get a list of prospective sights to see.

2. As a user, I want to enter a month to see if that month is a good time in the year to book a flight.

3. As a user, I want to enter a city to get a list of hotels.

4. As a user, I should be able to save my favorite locations.

CLI.rb
```
“Best Times for Travel”
“Sights to See”
“Hotels to Stay At”
"My Favorite Destinations”
```
### Points of Interest
* The API free test version only allows calls to a select list of cities for POI data: https://github.com/amadeus4dev/data-collection/blob/master/data/pois.md.
See the project file ~./app/city_hashes.rb
```
Bangalore
Latitude North: 13.023577, Longitude West: 77.536856, Latitude South: 12.923210, Longitude East: 77.642256

Barcelona
Latitude North: 41.42, Longitude West: 2.11, 
Latitude South: 41.347463, Longitude East: 2.228208

Berlin
Latitude North: 52.541755, Longitude West: 13.354201, Latitude South: 52.490569, Longitude East: 13.457198

Dallas
Latitude North: 32.806993, Longitude West: -96.836857, Latitude South: 32.740310, Longitude East: -96.737293

London
Latitude North: 51.520180, Longitude West: -0.169882, Latitude South: 51.484703, Longitude East: -0.061048

New York
Latitude North: 40.792027, Longitude West: -74.058204, Latitude South: 40.697607, Longitude East: -73.942847

Paris
Latitude North: 48.91, Longitude West: 2.25, 
Latitude South: 48.80, Longitude East: 2.46

San Francisco
Latitude North: 37.810980, Longitude West: -122.483716, 
Latitude South: 37.732007, Longitude East: -122.370076

```
---

# Relationships
User >--- UserLocation ---< Location

Location ---< Sight
Location ---< Hotel


---
# Contributor's Guide
We are open to any contributions and improvements. Please fork only if you intend on contributing.

See the CONTRIBUTING.md file in the main project directory for more information.


