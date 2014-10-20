require 'bundler'
Bundler.require

require 'sinatra/activerecord/rake'
require_relative 'connection'



namespace :db do 
	desc 'create restaurantsql database'
	task :create_db do 
		conn = PG::Connection.open()
		conn.exec('CREATE DATABASE restaurantsql;')
		conn.close
	end
	desc 'drop restaurantsql database'
	task :drop_db do 
		conn = PG::Connection.open()
		conn.exec('DROP DATABASE restaurantsql;')
		conn.close
	end
end
