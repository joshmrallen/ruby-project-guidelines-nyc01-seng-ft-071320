require_relative '../config/environment'

$prompt = TTY::Prompt.new

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
        "Exit"
    ]
end

def welcome_message
    puts "Welcome! What's your name?"
    name = gets.chomp
end

def get_user
    name = welcome_message
    user = User.find_by(name: name)
    if user
        return user
    else
        user = User.create(name: name, email: '', password: '')
        return user
    end
    #check if user exists yet
end

def favorite(user, location)
    favorite = $prompt.yes?("Would you like to add this city to your favorites?")
    user.locations << location
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

#pass 'choose' or 'enter' for either 'sign_up' or 'sign_in' methods
def password_prompt(choose_or_enter)
    vacation = $prompt.decorate("🏝")
    $prompt.mask("Please #{choose_or_enter} your password:", mask: vacation)
end

def email_prompt
    $prompt.ask("Please enter your email:") do |email|
        email.validate(/\A\w+@\w+\.\w+\Z/)
        email.messages[:valid?] = 'Invaid email address'
    end
end

#pass the recently created user instance
def get_credentials(choose_or_enter)
    email = email_prompt
    password = password_prompt("#{choose_or_enter}")
    credentials = {:email => email, :password => password}
end

#sign_in or sign_up
def login_or_register(user)
    if user.email.empty? && user.password.empty?
        $prompt.say("\nLooks like you're a new user! Please register a new account!\n")
        credentials = get_credentials('choose')
        user.email = credentials[:email]
        user.password = credentials[:password]
    else
        $prompt.say("\nWelcome back #{user.name}! Please sign-in below.\n")
        credentials = get_credentials('enter')
        existing_user = {:email => user.email, :password => user.password}
        while credentials != existing_user
            credentials = get_credentials('enter')
        end
    end
end


def run
    # prompt = TTY::Prompt.new
    banner
    #get_user displays welcome message, prompts user for name and returns a User instance
    current_user = get_user

    login_or_register(current_user)

    choice = 0
    city_choice = 0
    while city_choice != cities[8]
        choice = 0
        city_choice = $prompt.select("\nPlease choose your destination.\n", cities, per_page: 10)
        

            while choice != features[4]
                city = city_hash[city_choice]
                city_code = city_hash[city_choice][:code]
                location = Location.find_by(city: city_choice)

                choice = $prompt.select("\nWhat would you like to see?\n", features)

                case choice
                when features[0] #best times for travel
                    months = location.get_slow_months
                    if months.empty?
                        puts "\nYou're in luck! That location is slow all year-round.\n"
                    else
                        puts "\nHere are the best months to travel to #{city_choice}:\n"
                        months.each {|month| puts month}
                    end
                    favorite(current_user, location)
                when features[1] #sights to see
                    puts "\nHere are a few places to visit in #{city_choice}:\n\n"
                    sights = location.get_sights
                    sights.each {|sight| puts sight}
                    favorite(current_user, location)
                when features[2] #hotels to stay at
                    puts "\nHere are a few places to stay at in #{city_choice}:\n\n"
                    hotels = location.get_hotels
                    if hotels.empty?
                        "\nPlease check back later for participating Hotels.\n\n"
                    else 
                        hotels.each {|hotel| puts hotel} # Bangalore currently returning empty array
                        favorite(current_user, location)
                    end
                when features[3] #my favorite destinations
                    puts "\n Here's a list of your favorite destinations:\n"
                    if current_user.locations.empty?
                        puts "\nYou don't have any favorites yet!\n"
                    else
                        current_user.locations.uniq.each {|location| puts "\n#{location.city}\n"}
                    end
                else
                    choice = features[4]
                end

            end #inner while
        
        # binding.pry
    end #outer while - while not exit
# binding.pry
end #run method definition

run