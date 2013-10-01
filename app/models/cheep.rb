class Cheep
  include DataMapper::Resource

  belongs_to :user

  property :id, Serial
  property :message, Text, :required => true, :message => "Please cheep something"
end