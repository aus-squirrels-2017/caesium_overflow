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

get '/login' do
  erb :"users/login"
end

post '/login' do
  @user = User.find_by(email: params[:email])
  if @user && @user.authenticate(params[:email], params[:password])
    session[:user_id] = @user.id
    redirect '/'
  else
    redirect to('/authentication_problem')
  end
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end

get '/authentication_problem' do
  erb :"users/authentication_problem"
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :"users/user"
end
