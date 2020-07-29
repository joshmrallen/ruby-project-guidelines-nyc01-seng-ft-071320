class User < ActiveRecord::Base
    has_many :favorite_locations
    has_many :locations, through: :favorite_locations
end

# def self.opening
#     puts "Hello! If you are ready for a fun vacation, please type your name"
#     name = gets.chomp
#     user = User.find_by(name: name)
#     puts "Thanks!"
#     binding.pry
# end

