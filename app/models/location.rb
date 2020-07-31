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

    def get_slow_months
        months = AmadeusAPI.slow_season(city_hash[self.city][:code])
        if !months.empty?
            numbers = months.map do |month|
                month.delete_prefix("2017-")
            end
            long_form = numbers.map do |month|
                case month
                when "01"
                    month = "January"
                when "02"
                    month = "February"
                when "03"
                    month = "March"
                when "04"
                    month = "April"
                when "05"
                    month = "May"
                when "06"
                    month = "June"
                when "07"
                    month = "July"
                when "08"
                    month = "August"
                when "09"
                    month = "September"
                when "10"
                    month = "October"
                when "11"
                    month = "November"
                when "12"
                    month = "December"
                end
            end
            return long_form
        else
            return months
        end
    end #slow_months instance method

end