get '/comments/new' do
  erb :'/questions/_create_comment'
end

post '/comments/:id' do
  question = Question.find(params[:id])
  question.comments << Comment.new(body: (params[:new_post]), user_id: current_user)
  question.save
  redirect "/questions/#{question.id}"
end

post '/comments/comments/:id' do
  comment = Comment.find(params[:id])
  comment.comments << Comment.new(body: (params[:new_post]), user_id: current_user)
  comment.save
  if request.xhr?
    comment.body.to_s
  else
    redirect "/questions/#{comment.id}"
  end
end
