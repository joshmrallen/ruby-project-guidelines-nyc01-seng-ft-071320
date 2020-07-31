require_relative '../config/environment.rb'

User.delete_all
FavoriteLocation.delete_all
Location.delete_all
Sight.delete_all
Hotel.delete_all


def seed_locations
    city_names = city_hash.keys #city_hash is a method we get from the city_hashes file
    city_names.each do |name|
        Location.create(country: city_hash[name][:country], city: name)
    end
end

josh = User.create(name: "Josh", email: "josh@josh.com", password: "12345")
jim = User.create(name: "Jim", email: "jim@jim.com", password: "67890")

# def seed_sights
#     city_hash.each do |city|
#         name = city[0]
#         sight_list = AmadeusAPI.places(city_hash[name])
#         location = Location.all.find_by(city: city[0])
#         sight_list.each {|sight| location.sights << Sight.create(name: sight)}
#     end
# end

# seeding all the hotels takes a long time! created a similar instance method in Location class that creates Hotel instances for the instance

# def get_hotels(city_name)
#     hotels = AmadeusAPI.hotels_list(city_hash[city_name][:code])
#     location = Location.find_by(city: city_name)
#     hotels.each {|hotel| location.hotels << Hotel.create(name: hotel)}
# end

# def seed_hotels
#     city_hash.each do |city|
#         name = city[0]
#         hotels = AmadeusAPI.hotels_list(city_hash[name][:code])
#         location = Location.all.find_by(city: city[0])
#         hotels.each {|hotel| location.hotels << Hotel.create(name: hotel)}
#     end
# end

seed_locations
# seed_sights
# seed_hotels



