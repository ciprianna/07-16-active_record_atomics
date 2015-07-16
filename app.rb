require "pry"
require "active_record"
require "sqlite3"

require_relative "database_setup.rb"

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'photo_albums.db')

# So that ActiveRecord explains the SQL it's running in the logs.
ActiveRecord::Base.logger = ActiveSupport::Logger.new(STDOUT)

# Models
require_relative "models/photographer.rb"

binding.pry
