require 'faker'


def create_comment
  user_id = User.pluck(:id).sample
  user = User.find(user_id)
  comment = Comment.create!(:body =>Faker::Lorem.paragraph)
  comment.user = user 
  comment
end 

def create_vote
  user_id = User.pluck(:id).sample
  votable_classes = ['Question', 'Comment'].sample
  votable_id = nil

  if votable_classes == 'Question'
    votable_id = Question.pluck(:id).sample
  else
    votable_id = Comment.pluck(:id).sample
  end
  vote = Vote.create!(:user_id      => user_id, 
                  :votable_type => votable_classes,
                  :votable_id   => votable_id)
end



User.delete_all
Comment.delete_all
Question.delete_all

30.times do
  User.create!(:name => Faker::Name.name, 
               :email => Faker::Internet.email, 
               :password =>'123')
end

100.times do
  user_id = User.pluck(:id).sample
  user = User.find(user_id)
  question = user.questions.create!(:title   => Faker::Book.title,
                                    :body    => Faker::Lorem.paragraph)
  3.times do 
    question.votes.create!
    question.comments << create_comment
  end
  question.comments.sample.comments << create_comment  

end




