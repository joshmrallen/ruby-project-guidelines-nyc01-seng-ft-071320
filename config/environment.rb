require 'bundler'
require 'require_all'
# require 'pry'
# require 'amadeus'

Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
ActiveRecord::Base.logger = nil

# require_all 'lib'
require_all 'app'
# require_all 'api'
