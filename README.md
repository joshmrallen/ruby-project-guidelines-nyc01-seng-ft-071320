
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


