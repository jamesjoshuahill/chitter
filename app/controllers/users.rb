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