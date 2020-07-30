class Location < ActiveRecord::Base
    has_many :favorite_locations
    has_many :users, through: :favorite_locations
    has_many :sights
    has_many :hotels

    def get_hotels
        hotels = AmadeusAPI.hotels_list(city_hash[self.city][:code])
        hotels.each {|hotel| self.hotels << Hotel.create(name: hotel)}
    end

end