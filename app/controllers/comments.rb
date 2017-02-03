get '/comments/new' do
  erb :'/questions/_create_comment'
end

post '/comments/:id' do
  question = Question.find(params[:id])
  question.comments << Comment.new(body: (params[:new_post]))
  question.save
  erb :"questions/#{question.id}"
end
