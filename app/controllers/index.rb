get '/' do
  redirect '/questions'
end

get '/questions' do
  @questions = Question.all
  erb :index
end

post '/questions/:id/vote' do
  question = Question.find(params[:id])
  question.votes << Vote.new
  question.save
  if request.xhr?
    question.points
  else
    redirect "/questions"
  end
end
