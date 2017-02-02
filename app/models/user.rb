class User < ActiveRecord::Base
  has_many :comments, as: :commentable
  has_many :questions
  include BCrypt

  def self.authenticate_user(email, password)
    user = User.find_by(email: email)
    return false if user == nil
    return true if user.password == password
    false
  end

  def password
    @password ||= Password.new(hashed_password)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.hashed_password = @password
  end





end
