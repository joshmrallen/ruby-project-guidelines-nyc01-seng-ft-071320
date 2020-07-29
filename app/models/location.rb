class Location < ActiveRecord::Base
    has_many :favorite_locations
    has_many :users, through: :favorite_locations
end