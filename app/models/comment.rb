class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable
  belongs_to :question
  belongs_to :user
  belongs_to :votable, polymorphic: true
  has_many :votes, as: :votable

  # Remember to create a migration!
end
