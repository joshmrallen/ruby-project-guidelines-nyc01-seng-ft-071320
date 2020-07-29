require_relative '../config/environment.rb'
# require 'amadeus'
require 'pry'
require 'require_all'
require_relative './api/city_hashes'
require_relative './api/api.rb'

require_all 'app' 'api'

cities = ["Bangalore", "Barcelona", "Berlin", "Dallas", "London", "New York City", "Paris", "San Francisco"]

puts "Welcome! What's your name?"
name = gets.chomp
a = User.create(name: name)

puts "Nice to meet you, #{name}! Please choose from the following cities:"
cities.each_with_index do |city, index|
    puts "#{index + 1} for #{city}"
end


# OMG errors with gitignore

binding.pry
