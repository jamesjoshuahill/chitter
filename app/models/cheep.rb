class Cheep
  include DataMapper::Resource

  belongs_to :user, :required => false

  validates_presence_of :user, :message => "Please sign up, or log in to cheep"

  property :id, Serial
  property :message, Text, :required => true, :message => "Please cheep something"
end