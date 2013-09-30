require 'sinatra/base'
require 'data_mapper'
require 'haml'
require 'rack-flash'

require_relative 'models/user'
require_relative 'models/cheep'
require_relative 'helpers/application'

env = ENV["RACK_ENV"] || "development"

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")
DataMapper.finalize
DataMapper.auto_upgrade!

class Chitter < Sinatra::Base
  set :sessions, true
  set :session_secret, 'Even though the sound of it is something quite atrocious'
  use Rack::Flash
  use Rack::MethodOverride

  helpers Sinatra::ApplicationHelpers
  
  get '/' do
    @cheeps = Cheep.all(:order => [ :id.desc ])
    haml :index
  end

  get '/users/new' do
    @user = User.new
    haml :'users/new'
  end

  post '/users/new' do
    @user = User.create(name: params[:name],
                email: params[:email],
                password: params[:password],
                password_confirmation: params[:password_confirmation],
                username: params[:username])
    if @user.save
      session[:user_id] = @user.id
      redirect to '/'
    else
      flash.now[:errors] = @user.errors.full_messages
      haml :'users/new'
    end
  end

  get '/sessions/new' do
    haml :'sessions/new'
  end

  post '/sessions/new' do
    email, password = params[:email], params[:password]
    user = User.authenticate(email, password)
    if user
      session[:user_id] = user.id
      redirect to '/'
    else
      flash[:errors] = ["The email or password you typed did not work"]
      haml :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    redirect to '/'
  end

  get '/cheeps/new' do
    haml :'cheeps/new'
  end

  post '/cheep' do
    user = User.first(:id => session[:user_id])
    Cheep.create(message: params[:message], user: user)
    redirect to '/'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end