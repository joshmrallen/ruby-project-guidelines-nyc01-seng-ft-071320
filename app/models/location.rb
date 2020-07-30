class Location < ActiveRecord::Base
    has_many :favorite_locations
    has_many :users, through: :favorite_locations
    has_many :sights
    has_many :hotels

    def get_hotels
        hotels = AmadeusAPI.hotels_list(city_hash[self.city][:code])
        hotels.each {|hotel| self.hotels << Hotel.create(name: hotel)}
    end

    def get_sights
        sights = AmadeusAPI.places(city_hash[self.city])
        sights.each {|sight| self.sights << Sight.create(name: sight)}
    end

end