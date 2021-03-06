class Question < ActiveRecord::Base
  belongs_to :user
  has_many :comments, as: :commentable
  belongs_to :votable, polymorphic: true
  has_many :votes, as: :votable

  def points
    votes.count - votes.where(downvote: true).count*2
  end

  def self.most_recent(number=10)
    questions = Question.order(created_at: :desc).limit(number)
    questions.sort_by {|question| [-(question.points),question.created_at]}
  end

  def time_since_creation
    ((Time.now - created_at) / 3600).round
  end
end
