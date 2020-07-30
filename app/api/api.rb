require_relative './api_key.rb'

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
    
    def self.flight_traffic(city_code)
        # check a flight destination's busiest period
        # will always use 2017 for period for simplicities' sake since the period is just used to extrapulate general traffic flow for future flight-booking purposes
        response = amadeus.travel.analytics.air_traffic.busiest_period.get(
            cityCode: city_code,
            period: '2017',
            direction: Amadeus::Direction::ARRIVING
    )
        response.result
    end

    def self.traffic_data(city_code)
        raw = self.flight_traffic(city_code)
        raw["data"]
    end

    #assuming score of 9 means a city receives a lot of traffic
    def self.busy_season(city_code)
        busy = self.traffic_data(city_code)
        busy_months = busy.select {|hash| hash["analytics"]["travelers"]["score"] > 8}
        busy_months.map {|hash| hash["period"]}
    end

    #assuming a score of 8 or below for slower months
    def self.slow_season(city_code)
        slow = self.traffic_data(city_code)
        slow_months = slow.select {|hash| hash["analytics"]["travelers"]["score"] <= 8}
        slow_months.map {|hash| hash["period"]}
    end
         
    #takes as argument a hash that includes the square lat/long for each city accepted by the test api
    def self.places_of_interest(city_hash)
        city_name = city_hash.keys[0]
        response = amadeus.reference_data.locations.points_of_interest.by_square.get(
            north: city_hash[:north],
            west: city_hash[:west],
            south: city_hash[:south],
            east: city_hash[:east]
        )
        response.result
    end

    def self.places(city_hash)
        poi = self.places_of_interest(city_hash)
        sights = poi["data"].select {|hash| hash["category"] == "SIGHTS"}
        sights.map {|hash| hash["name"]}
    end

    def self.hotels(city_code)
        response = amadeus.shopping.hotel_offers.get(
            cityCode: city_code
        )
        response.result
    end

    def self.hotels_list(city_code)
        hotels = self.hotels(city_code)
        hotels["data"].map {|hash| hash["hotel"]["name"]}
    end
    

end

#add airport & city search api

#use below puts and gets for prompt
# def busy_season
#     puts "Hello, and welcome to Safe Vacation. What city would you like to go to?"
#     city = gets.chomp

#     raw = AmadeusAPI.busy(city)

#     busy = raw["data"]

#     #for our purposes, any score of 8 and above will be considered 'very busy'
#     fast_times = busy.select do |hash|
#         hash["analytics"]["travelers"]["score"] > 8
#     end

#     puts "Here were the busiest months in 2017:"

#     fast_times.each do |hash|
#         puts "#{hash["period"]}"
#     end
    
# end