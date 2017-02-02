get '/register' do
  erb :register
end

post '/register' do
  new_user = User.new({email: params["email"], name: params["username"]})
  new_user.password = params["password"]
  if new_user.valid?
    new_user.save
    session[:user_id] = new_user.id
    redirect to('/')
  else
    redirect to('registration_error')
  end
end

get '/log_in' do
  erb :log_in
end

post '/log_in' do
  if User.authenticate_user(params[:password], params[:email])
    session[:user_id] = User.find_by(email: params[:email]).id
    redirect to('/entries')
  else
    redirect to('/authentication_problem')
  end
end

get '/log_out' do
  session[:user_id] = nil
  redirect to('/entries')
end

get '/authentication_problem' do
  erb :authentication_problem
end

get '/profile/:id' do
  erb :user
end
