get '/' do
  @cheeps = Cheep.all(:order => [ :id.desc ])
  haml :index
end