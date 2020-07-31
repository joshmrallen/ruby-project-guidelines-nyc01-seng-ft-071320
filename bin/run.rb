require_relative '../config/environment'

def banner
    system("clear")
    puts "                                                                                                                         
                                                                                                                         
    VVVVVVVV           VVVVVVVV                                                            tttt                              
    V::::::V           V::::::V                                                         ttt:::t                              
    V::::::V           V::::::V                                                         t:::::t                              
    V::::::V           V::::::V                                                         t:::::t                              
     V:::::V           V:::::Vaaaaaaaaaaaaa      cccccccccccccccc  aaaaaaaaaaaaa  ttttttt:::::ttttttt        eeeeeeeeeeee    
      V:::::V         V:::::V a::::::::::::a   cc:::::::::::::::c  a::::::::::::a t:::::::::::::::::t      ee::::::::::::ee  
       V:::::V       V:::::V  aaaaaaaaa:::::a c:::::::::::::::::c  aaaaaaaaa:::::at:::::::::::::::::t     e::::::eeeee:::::ee
        V:::::V     V:::::V            a::::ac:::::::cccccc:::::c           a::::atttttt:::::::tttttt    e::::::e     e:::::e
         V:::::V   V:::::V      aaaaaaa:::::ac::::::c     ccccccc    aaaaaaa:::::a      t:::::t          e:::::::eeeee::::::e
          V:::::V V:::::V     aa::::::::::::ac:::::c               aa::::::::::::a      t:::::t          e:::::::::::::::::e 
           V:::::V:::::V     a::::aaaa::::::ac:::::c              a::::aaaa::::::a      t:::::t          e::::::eeeeeeeeeee  
            V:::::::::V     a::::a    a:::::ac::::::c     ccccccca::::a    a:::::a      t:::::t    tttttte:::::::e           
             V:::::::V      a::::a    a:::::ac:::::::cccccc:::::ca::::a    a:::::a      t::::::tttt:::::te::::::::e          
              V:::::V       a:::::aaaa::::::a c:::::::::::::::::ca:::::aaaa::::::a      tt::::::::::::::t e::::::::eeeeeeee  
               V:::V         a::::::::::aa:::a cc:::::::::::::::c a::::::::::aa:::a       tt:::::::::::tt  ee:::::::::::::e  
                VVV           aaaaaaaaaa  aaaa   cccccccccccccccc  aaaaaaaaaa  aaaa         ttttttttttt      eeeeeeeeeeeeee  
                                                                                                                             
                                                                                                                             
                                                                                                                             
                                                                                                                             
                                                                                                                             
                                                                                                                             
                                                                                                                             "
end

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
        # "Sign Out",
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
    get_name
end

def features
    [
        "Best Times for Travel",
        "Sights to See",
        "Hotels to Stay At",
        "My Favorite Destinations",
        "Exit"
    ]
end


def run
    prompt = TTY::Prompt.new
    banner
    current_user = welcome_message

    choice = 0
    city_choice = 0
    while city_choice != cities[8]
        choice = 0
        city_choice = prompt.select("\nPlease choose your destination.\n", cities, per_page: 10)
        # hash_key = city_choice.to_s
        # while city_choice != cities[8] #infinite loop after features while loop exits
            #this if statement seems to only run once, only allowing the inner while loop to run for just one city_choice value

            # if city_choice == "Exit"
            #     puts "Have a nice day!"
            # else
                # city = city_hash[city_choice]
                # city_code = city_hash[city_choice][:code] # upon Exit, throws NoMethodError '[]' for nil:NilClass because city_hash[city_choice] returns 'nil'
                # location = Location.find_by(city: city_choice)
                #location not updating with city_choice -- why?
            # end

            while choice != features[4]
                city = city_hash[city_choice]
                city_code = city_hash[city_choice][:code]
                location = Location.find_by(city: city_choice)

                choice = prompt.select("\nWhat would you like to see?\n", features)

                case choice
                when features[0] #best times for travel
                    months = location.get_slow_months
                    if months.empty?
                        puts "\nYou're in luck! That location is slow all year-round.\n"
                    else
                        puts "\nHere are the best months to travel to #{city_choice}:\n"
                        months.each {|month| puts month}
                    end
                    favorite(current_user, location, prompt)
                when features[1] #sights to see
                    puts "\nHere are a few places to visit in #{city_choice}:\n\n"
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
                when features[3] #my favorite destinations -- ERROR - favorites only saves the first destination choice -- location probably isn't updating when city_choice is called
                    puts "\n Here's a list of your favorite destinations:\n"
                    if current_user.locations.empty?
                        puts "\nYou don't have any favorites yet!\n"
                        # city_choice = prompt.select("\nPlease choose your destination.\n", cities, per_page: 9)
                    else
                        current_user.locations.uniq.each {|location| puts "\n#{location.city}\n"}
                    end
                else
                    choice = features[4]
                end

            end #inner while
            
        # end #while not sign out
        
        # binding.pry
    end #outer while - while not exit
binding.pry
end #run method definition

run