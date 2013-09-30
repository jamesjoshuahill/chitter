require 'dotenv/tasks'
require 'data_mapper'

task :database_env => :dotenv do
  env = ENV["RACK_ENV"] || "development"
  DataMapper.setup(:default, ENV["DATABASE_URL_#{env.upcase}"])
end

DataMapper.finalize
DataMapper.auto_upgrade!

task :auto_migrate do
  DataMapper.auto_migrate!
  puts "Auto-migrate complete (no data loss)"
end

task :auto_upgrade do
  DataMapper.auto_upgrade!
  puts "Auto-upgrade complete (data may have been lost)"
end