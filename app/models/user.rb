class User < ActiveRecord::Base
    has_many :favorite_locations
    has_many :locations, through: :favorite_locations
end
