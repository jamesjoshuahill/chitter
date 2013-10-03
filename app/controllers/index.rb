get '/' do
  session[:user_id] = nil if current_user.nil?
  @cheeps = Cheep.all(:order => [ :id.desc ])
  haml :index
end