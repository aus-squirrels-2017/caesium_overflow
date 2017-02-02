class Question < ActiveRecord::Base
  belongs_to :user
  has_many :comments, as: :commentable

  def points
    votes.sum(:value)
  end

   def time_since_creation
    ((Time.now - created_at) / 3600).round
  end
end
