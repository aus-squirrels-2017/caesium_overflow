get '/' do
  session[:number] = 10
  redirect '/questions'
end

get '/questions' do
  session[:number] = 10
  @questions = Question.most_recent
  erb :index
end

get '/questions/all' do
  session[:number] += 10
  @questions = Question.most_recent(session[:number])
  erb :index
end

post '/questions/:id/vote' do
  question = Question.find(params[:id])
  vote = Vote.new
  if params[:submit_param] == 'downvote' || params.has_key?("downvote")
    vote.downvote = true
  end
  question.votes << vote
  question.save
  if request.xhr?
    question.points.to_s
  else
    redirect "/questions"
  end
end
