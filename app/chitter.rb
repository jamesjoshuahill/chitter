require 'sinatra'
require 'data_mapper'
require 'haml'
require 'rack-flash'
require 'sinatra/partial'

require_relative 'models/user'
require_relative 'models/cheep'
require_relative 'helpers/application'
require_relative 'data_mapper_setup'

set :public_folder, 'public'
enable :sessions
set :session_secret, 'Even though the sound of it is something quite atrocious'
use Rack::Flash

get '/' do
  @cheeps = Cheep.all(:order => [ :id.desc ])
  haml :index
end

get '/users/new' do
  @user = User.new
  haml :'users/new'
end

post '/users/new' do
  if !session[:user_id].nil?
    flash[:notice] = "You are already logged in"
    redirect to '/'
  else
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
end

get '/sessions/new' do
  haml :'sessions/new'
end

post '/sessions/new' do
  if !session[:user_id].nil?
    flash[:notice] = "You are already logged in"
    redirect to '/'
  else
    email, password = params[:email], params[:password]
    user = User.authenticate(email, password)
    if user
      session[:user_id] = user.id
      redirect to '/'
    else
      flash.now[:errors] = ["The email or password you typed did not work"]
      haml :'sessions/new'
    end
  end
end

delete '/sessions' do
  session[:user_id] = nil
  redirect to '/'
end

get '/cheeps/new' do
  haml :'cheeps/new'
end

post '/cheeps/new' do
  user = User.first(:id => session[:user_id])
  cheep = Cheep.create(message: params[:message],
                       user: user)
  if cheep.save
    flash[:notice] = "You cheeped!"
    redirect to '/'
  else
    flash.now[:errors] = cheep.errors.full_messages
    haml :'cheeps/new'
  end
end