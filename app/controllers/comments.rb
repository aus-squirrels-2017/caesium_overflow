get '/comments/new' do
  erb :'/questions/_create_comment'
end

post '/comments/:id' do
  question = Question.find(params[:id])
  question.comments << Comment.new(body: (params[:new_post]), user_id: current_user.id)
  question.save
  redirect "/questions/#{question.id}"
end

post '/comments/comments/:id' do
  comment = Comment.find(params[:id])
  @c = Comment.new(body: (params[:new_post]), user_id: current_user.id)
  comment.comments << @c
  comment.save
  if request.xhr?
    erb :_comment, layout: false, locals: { comment: @c}
  else
    redirect "/questions/#{comment.id}"
  end
end
