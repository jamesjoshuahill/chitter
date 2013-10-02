require 'rubygems'
require 'sass/plugin/rack'

require File.join(File.dirname(__FILE__), 'app/chitter.rb')

Sass::Plugin.options[:style] = :compressed
use Sass::Plugin::Rack

run Sinatra::Application