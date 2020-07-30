require_relative '../config/environment.rb'

Location.delete_all


def seed_locations
    city_names = city_hash.keys #city_hash is a method we get from the city_hashes file
    city_names.each do |name|
        Location.create(country: city_hash[name][:country], city: name)
    end
end

def seed_sights
    city_hash.each do |city|
        name = city[0]
        sight_list = AmadeusAPI.places(city_hash[name])
        location = Location.all.find_by(city: city[0])
        sight_list.each {|sight| location.sights << Sight.create(name: sight)}
    end
end



