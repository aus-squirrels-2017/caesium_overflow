get '/' do
  redirect '/questions'
end

get '/questions' do
  @questions = Question.all
  erb :index
end
