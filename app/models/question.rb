class Question < ActiveRecord::Base
  belongs_to :user
  has_many :comments, as: :commentable
  belongs_to :votable, polymorphic: true
  has_many :votes, as: :votable
  # def points
  #   votes.sum(:value)
  # end

   def time_since_creation
    ((Time.now - created_at) / 3600).round
  end
end
