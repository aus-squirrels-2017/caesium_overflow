get '/register' do
  erb :"users/register"
end

post '/register' do
  new_user = User.new({email: params["email"], name: params["username"]})
  new_user.password = params["password"]
  if new_user.valid?
    new_user.save
    session[:user_id] = new_user.id
    redirect to("/users/#{new_user.id}")
  else
    403
  end
end

get '/log_in' do
  erb :"users/log_in"
end

post '/log_in' do
  if User.authenticate_user(params[:password], params[:email])
    session[:user_id] = User.find_by(email: params[:email]).id
    redirect to('/')
  else
    redirect to('/authentication_problem')
  end
end

get '/log_out' do
  session[:user_id] = nil
  redirect to('/')
end

get '/authentication_problem' do
  erb :"users/authentication_problem"
end

get '/users/:id' do
  @user = User.find(:id)
  erb :"users/user"
end
