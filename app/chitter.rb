require 'sinatra'
require 'data_mapper'
require 'haml'
require 'rack-flash'
require 'sinatra/partial'

require_relative 'models/user'
require_relative 'models/cheep'
require_relative 'helpers/application'
require_relative 'data_mapper_setup'

require_relative 'controllers/index'
require_relative 'controllers/users'
require_relative 'controllers/sessions'
require_relative 'controllers/cheeps'

set :public_folder, 'public'
enable :sessions
set :session_secret, 'Even though the sound of it is something quite atrocious'
use Rack::Flash