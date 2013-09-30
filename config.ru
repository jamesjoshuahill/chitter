require 'rubygems'
require 'sass/plugin/rack'

require File.join(File.dirname(__FILE__), 'app/chitter.rb')

Sass::Plugin.options[:style] = :compressed
use Sass::Plugin::Rack

map "/public" do
  run Rack::Directory.new("./public")
end

run Chitter