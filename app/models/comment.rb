class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable
  belongs_to :question
  belongs_to :user
  belongs_to :votable, polymorphic: true
  has_many :votes, as: :votable

  def points
    votes.count - votes.where(downvote: true).count*2
  end

  def self.most_recent(number=10)
    comments = Comment.order(created_at: :desc).limit(number)
    comments.sort_by {|comment| [-(comment.points),comment.created_at]}
  end

  def time_since_creation
    ((Time.now - created_at) / 3600).round
  end
end
