#hashes of latitude and longitude box for each city accepted by the api
#TODO: add country attr, and city attr

def city_hash
    {
        "Bangalore" => {
            :code => "BLR",
            :name => "Bangalore",
            :country => "India",
            :north => 13.023577,
            :west => 77.536856,
            :south => 12.923210,
            :east => 77.642256
        },
        "Barcelona" => {
            :code => "BCN",
            :name => "Barcelona",
            :country => "Spain",
            :north => 41.42,
            :west => 2.11,
            :south => 41.347463,
            :east => 2.228208
        },
        "Berlin" => {
            :code => "TXL",
            :name => "Berlin",
            :country => "Germany",
            :north => 52.541755,
            :west => 13.354201,
            :south => 52.490569,
            :east => 13.457198
        },
        "Dallas" => {
            :code => "DFW",
            :name => "Dallas",
            :country => "USA",
            :north => 32.806993,
            :west => -96.836857,
            :south => 32.740310,
            :east => -96.737293
        },
        "London" => { 
            :code => "LON",
            :name => "London",
            :country => "UK",
            :north => 51.520180,
            :west => -0.169882,
            :south => 51.484703,
            :east => -0.061048
        },
        "New York City" => {
            :code => "NYC",
            :name => "New York City",
            :country => "USA",
            :north => 40.792027,
            :west => -74.058204,
            :south => 40.697607,
            :east => -73.942847
        },
        "Paris" => {
            :code => "PAR",
            :name => "Paris",
            :country => "France",
            :north => 48.91,
            :west => 2.25,
            :south => 48.80,
            :east => 2.46
        },
        "San Francisco" => { 
            :code => "SFO",
            :name => "San Francisco",
            :country => "USA",
            :north => 37.810980,
            :west => -122.483716,
            :south => 37.732007,
            :east => -122.370076
        }
    }
end