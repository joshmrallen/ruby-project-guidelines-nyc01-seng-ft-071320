require 'bundler'
# require 'amadeus'
# require_relative '../app/models/user.rb'
# require_relative '../app/models/sight.rb'
# require_relative '../app/models/location.rb'
# require_relative '../app/models/hotel.rb'
# require_relative '../app/models/favorite_location.rb'

Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
ActiveRecord::Base.logger = nil

require_all 'lib'
require_all 'app'
require_all 'db'

