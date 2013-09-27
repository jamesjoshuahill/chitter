require 'sinatra/base'
require 'data_mapper'
require 'haml'
require 'rack-flash'

require_relative 'models/user'

env = ENV["RACK_ENV"] || "development"

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")
DataMapper.finalize
DataMapper.auto_upgrade!

class Chitter < Sinatra::Base
  set :sessions, true
  use Rack::Flash
  
  get '/' do
    haml :index
  end

  get '/users/new' do
    haml :'users/new'
  end

  post '/users' do
    User.create(name: params[:name],
                email: params[:email],
                password: params[:password],
                username: params[:username])
    flash[:notice] = "Hi #{params[:name]}, happy cheeping!"
    redirect to '/'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end