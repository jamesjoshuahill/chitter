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