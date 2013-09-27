require 'sinatra/base'
require 'data_mapper'
require 'haml'

class Chitter < Sinatra::Base
  get '/' do
    haml :index
  end

  get '/users/new' do
    haml :'users/new'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end