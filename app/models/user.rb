class User < ActiveRecord::Base
  has_many :comments, as: :commentable
  has_many :questions
  belongs_to :votable, polymorphic: true
  has_many :votes, as: :votable
  include BCrypt

  def authenticate(email, password)
    self.password == password && self.email == email
  end

  def password
    @password ||= Password.new(hashed_password)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.hashed_password = @password
  end



end
