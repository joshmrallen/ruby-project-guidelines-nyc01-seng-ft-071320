require_relative '../config/environment'


def cities
    [
        "Bangalore", 
        "Barcelona", 
        "Berlin", 
        "Dallas", 
        "London", 
        "New York City", 
        "Paris", 
        "San Francisco",
        "Exit"
    ]
end

def get_name
    puts "Welcome! What's your name?"
    name = gets.chomp
    User.create(name: name)
end

def favorite(user, location, prompt)
    favorite = prompt.yes?("Would you like to add this city to your favorites?")
    user.locations << location
end

def welcome_message
    # add banner here
    get_name
end

def features
    [
        "Best Times for Travel",
        "Sights to See",
        "Hotels to Stay At",
        "My Favorite Destinations",
        "Other Destinations",
        "Exit"
    ]
end


def run(features)
    system("clear")
    prompt = TTY::Prompt.new
    current_user = welcome_message

    choice = 0
    city_choice = 0
    while city_choice != cities[8]
        city_choice = prompt.select("\nPlease choose your destination.\n", cities, per_page: 9)

        if city_choice == "Exit"
            puts "Have a nice day!"
        else
            city = city_hash[city_choice]
            city_code = city_hash[city_choice][:code] # upon Exit, throws NoMethodError '[]' for nil:NilClass because city_hash[city_choice] returns 'nil'
            location = Location.find_by(city: city_choice)
            #location not updating with city_choice -- why?

            while choice != features[5]
                choice = prompt.select("\nWhat would you like to see?\n", features)
    
                case choice
                when features[0] #best times for travel
                    months = AmadeusAPI.slow_season(city_code)
                    if months == []
                        puts "\nYou're in luck! That location is slow all year-round.\n"
                    else
                        puts "\nHere are the best months to travel to #{city_choice}:\n"
                        months.each {|month| puts month}
                    end
                    favorite(current_user, location, prompt)
                when features[1] #sights to see
                    puts "\nHere are a few place to visit in #{city_choice}:\n\n"
                    sights = location.get_sights
                    sights.each {|sight| puts sight}
                    favorite(current_user, location, prompt)
                when features[2] #hotels to stay at
                    puts "\nHere are a few places to stay at in #{city_choice}:\n\n"
                    hotels = location.get_hotels
                    if hotels.empty?
                        "\nPlease check back later for participating Hotels.\n\n"
                    else 
                        hotels.each {|hotel| puts hotel} # Bangalore currently returning empty array
                        favorite(current_user, location, prompt)
                    end
                when features [3] #my favorite destinations -- ERROR - favorites only saves the first destination choice -- location probably isn't updating when city_choice is called
                    puts "\n Here's a list of your favorite destinations:\n"
                    if current_user.locations.empty?
                        puts "\nYou don't have any favorites yet!\n"
                        city_choice = prompt.select("\nPlease choose your destination.\n", cities, per_page: 9)
                    else
                        current_user.locations.each {|location| puts "\n#{location.city}\n"}
                    end
                when features [4] #other destinations
                    city_choice = prompt.select("\nPlease choose your destination.\n", cities, per_page: 9)
                    # location = Location.find_by(city: city_choice)
                else
                    # choice = prompt.select("\nWhat would you like to see?\n", features)
                end
            
            end
             # throws undefined NoMethod error when Exit is chosen in outer while loop
        end
        # binding.pry
    end     

end

run(features)