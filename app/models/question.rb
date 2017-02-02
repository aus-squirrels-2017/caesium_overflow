class Question < ActiveRecord::Base
  belongs_to :user
  has_many :comments, as: :commentable
  # Remember to create a migration!
end
