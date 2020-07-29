class Location < ActiveRecord::Base
    has_many :favorite_locations
    has_many :users, through: :favorite_locations
    has_many :sights
    has_many :hotels
end