require 'bundler'
# require_relative '../app/models/user.rb'
# require_relative '../app/models/location.rb'
# require_relative '../app/models/favorite_location.rb'
Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'
require_all 'app'
