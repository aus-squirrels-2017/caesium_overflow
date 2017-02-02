class User < ActiveRecord::Base
  has_many :comments, as: :commentable
  has_many :questions
  # Remember to create a migration!
end
