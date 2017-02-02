# pulling
# get '/questions/new' do
#   return erb :'404' unless current_user
#   @id = current_user.id
# erb :'/'
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
