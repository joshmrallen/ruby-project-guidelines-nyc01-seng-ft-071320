require_relative '../config/environment'

def functions
    functions = {
        "1" => "See the best times to travel.", 
        "2" => "See a list of sights to see.", 
        "3" => "See a list of local hotels."
    }
end

def cities
    cities = {
        "1" => "Bangalore", 
        "2" => "Barcelona", 
        "3" => "Berlin", 
        "4" => "Dallas", 
        "5" => "London", 
        "6" => "New York City", 
        "7" => "Paris", 
        "8" => "San Francisco"
    }
end

def get_name
    puts "Welcome! What's your name?"
    name = gets.chomp
    User.create(name: name)
end

def cities_selector(name)
    cities
    puts "Nice to meet you, #{name}! Please choose from the following cities:"
    cities.each do |number, city|
        puts "#{number} -- #{city}"
    end
end

def activities
    functions
    puts "What would you like to do?"
    functions.each do |number, function|
        puts "#{number} -- #{function}"
    end
end


def run
    user = get_name
    cities_selector(user.name)
    city_choice = gets.chomp

    code = city_hash[cities[city_choice]][:code]
    city = city_hash[cities[city_choice]]
    location = Location.find_by(city: city[:name])

    activities
    activity_choice = gets.chomp

    case activity_choice
    when "1"
        months = AmadeusAPI.slow_season(code)
        if months == []
            puts "That location is slow year-round."
        else
            months.each {|month| puts month}
        end
    when "2"
        sights = AmadeusAPI.places(city)
        sights.each {|poi| puts poi}
    when "3"
        hotels = location.get_hotels
        hotels.each {|hotel| puts hotel}
    else
        puts "That is not a valid choice."
    end

    binding.pry

end

run