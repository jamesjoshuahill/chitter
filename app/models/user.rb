require 'bcrypt'

class User
  include DataMapper::Resource

  has n, :cheeps

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password, :message => "The passwords you typed did not match"

  property :id, Serial
  property :name, String, :required => true, :message => "Please provide your name"
  property :email, String, :unique => true, :required => true, :format => :email_address, :messages => {
      :presence  => "Please provide your email address",
      :is_unique => "There is already an account with this email address",
      :format => "Please check your email address is typed correctly"
    }
  property :password_digest, Text, :required => true
  property :username, String, :unique => true, :required => true, :messages => {
    :presence => "Please choose a username",
    :is_unique => "There is already an account with this username"
  }

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