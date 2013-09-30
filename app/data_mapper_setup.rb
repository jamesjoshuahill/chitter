env = ENV["RACK_ENV"] || "development"

if env == "production"
  database = ENV["DATABASE_URL"]
else
  database = "postgres://localhost/chitter_#{env}"
end

DataMapper.setup(:default, database)
DataMapper.finalize
DataMapper.auto_upgrade!