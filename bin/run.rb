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
        "See the Best Times for Travel",
        "Sights to See",
        "Hotels to Stay At",
        "Exit"
    ]
end


def run(features)
    prompt = TTY::Prompt.new
    current_user = welcome_message

    choice = 0
    city_choice = 0
    while city_choice != cities[8]
        city_choice = prompt.select("\nPlease choose your destination.\n", cities)

        city = city_hash[city_choice]
        # city_code = city_hash[city_choice][:code] # upon Exit, throws undefined method NoMethodError '[]' for nil:NilClass
        location = Location.find_by(city: city_choice)


        while choice != features[3]
            choice = prompt.select("\nWhat would you like to do?\n", features)

            case choice
            when features[0]
                months = AmadeusAPI.slow_season(city_code)
                if months == []
                    puts "\nYou're in luck! That location is slow all year-round.\n"
                else
                    puts "\nHere are the best months to travel to #{city_choice}:\n"
                    months.each {|month| puts month}
                end
                favorite(current_user, location, prompt)
            when features[1]
                puts "\nHere are a few place to visit in #{city_choice}:\n"
                sights = location.get_sights
                sights.each {|sight| puts sight}
                favorite(current_user, location, prompt)
            when features[2]
                puts "\nHere are a few places to stay at in #{city_choice}:\n"
                hotels = location.get_hotels
                if hotels == []
                    "\nPlease check back later for participating Hotels.\n"
                else 
                    hotels.each {|hotel| puts hotel} # Bangalore currently returning empty array
                    favorite(current_user, location, prompt)
                end
            else
                # puts "\nThat is not a valid choice.\n"
            end
        
        end
         # throws undefined NoMethod error when Exit is chosen in outer while loop
    end     


    # city_choice = cities_selector

    # code = city_hash[cities[city_choice]][:code]
    # city = city_hash[cities[city_choice]]
    # location = Location.find_by(city: city[:name])

    # activity_choice = activities

    # case activity_choice
    # when "1"
    #     months = AmadeusAPI.slow_season(code)
    #     if months == []
    #         puts "That location is slow year-round."
    #     else
    #         months.each {|month| puts month}
    #     end
    # when "2"
    #     sights = AmadeusAPI.places(city)
    #     sights.each {|poi| puts poi}
    # when "3"
    #     hotels = location.get_hotels
    #     hotels.each {|hotel| puts hotel}
    # else
    #     puts "That is not a valid choice."
    # end

    # option = favorites

    # if option == "y" || option == "Y"
    #     user.locations << location
    # elsif option == "n" || option =="N"
    #     cities_selector
    # else
    #     puts "That's not a valid selection."
    # end

end

run(features)