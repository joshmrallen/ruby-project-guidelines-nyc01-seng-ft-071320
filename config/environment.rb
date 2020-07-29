require 'bundler'
require 'require_all'
# require 'amadeus'
require_relative '../app/models/'

Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
ActiveRecord::Base.logger = nil

# require_all 'lib'
require_all 'app'
# require_all 'api'
>>>>>>> josh
