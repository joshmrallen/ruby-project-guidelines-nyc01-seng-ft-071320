require 'amadeus'
require 'pry'
require 'json'
require_relative 'api_key'


class AmadeusAPI
    
    def self.amadeus
        Amadeus::Client.new({
            client_id: AMADEUS_CLIENT_ID,
            client_secret: AMADEUS_CLIENT_SECRET
        })
    end

    begin
        puts amadeus.reference_data.urls.checkin_links.get({ airlineCode: 'BA'})
    rescue Amadeus::ResponseError => error
        puts error
    end


    # every API call returns a Amadeus::Response object.
    # raw response string is returned with .body, parsed JSON with .result, and raw response body as .data
    
    def self.busy(city_code)
        # check a flight destination's busiest period
        # will always use 2017 for period for simplicities' sake since the period is just used to extrapulate general traffic flow for future flight-booking purposes
        response = amadeus.travel.analytics.air_traffic.busiest_period.get(
            cityCode: city_code,
            period: '2017',
            direction: Amadeus::Direction::ARRIVING
    )
        response.result
    end
         

end

def busy_season
    puts "Hello, and welcome to Safe Vacation. What city would you like to go to?"
    city = gets.chomp

    raw = AmadeusAPI.busy(city)

    busy = raw["data"]

    #for our purposes, any score of 8 and above will be considered 'very busy'
    fast_times = busy.select do |hash|
        hash["analytics"]["travelers"]["score"] > 8
    end

    puts "Here were the busiest months in 2017:"

    fast_times.each do |hash|
        puts "#{hash["period"]}"
    end
    
end



binding.pry