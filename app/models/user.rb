class User < ActiveRecord::Base
    has many :favorite_locations
    has many :locations, through: :favorite_locations
end
