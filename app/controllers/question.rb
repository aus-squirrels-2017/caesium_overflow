# pulling
# get '/questions/new' do
#   return erb :'404' unless current_user
#   @id = current_user.id
#   erb :'/'
# end

post '/questions' do
  @question = Question.new(params[:question])

  if @question.save
    redirect "/questions/#{@question.id}"
  else
    @errors = @question.errors.full_messages
    erb :'questions/new'
  end
end

get '/questions/:id' do
  @question = find_and_ensure_question(params[:id])
  # @name = User.find_by(id: @question.user_id).name
  erb :'question'
end

put '/questions/:id' do
  @question = find_and_ensure_question(params[:id])
  @question.assign_attributes(params[:question])
  # @entry = find_and_ensure_entry(params[:id])
  # @name = User.find_by(id: @entry.user_id).username

  if @question.save
    redirect "questions/#{@question.id}"
  else
    @question = @question.errors.full_messages
    erb :'questions/edit'
  end
end

delete '/questions/:id' do
  @question = find_and_ensure_question(params[:id])
  @question.destroy
  redirect '/questions'
end

get '/questions/:id/edit' do
  @question = find_and_ensure_question(params[:id])
  erb :'questions/edit'
end
