require 'bcrypt'

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
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end





end
