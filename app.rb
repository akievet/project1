require 'bundler'
Bundler.require

ROOT_PATH = Dir.pwd
Dir[ROOT_PATH+"/models/*.rb"].each{ |file| require file}

ActiveRecord::Base.establish_connection(
	adapter: "postgresql",
	database: "restaurantsql"
)