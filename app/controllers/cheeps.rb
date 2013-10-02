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