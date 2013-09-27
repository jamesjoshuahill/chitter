require 'bcrypt'

class User
  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password, :message => "The passwords you typed did not match"

  property :id, Serial
  property :name, String
  property :email, String, :unique => true, :message => "There is already an account with this email address"
  property :password_digest, Text
  property :username, String, :unique => true, :message => "There is already an account with this username"

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = first(:email => email)
    if user and BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end
end