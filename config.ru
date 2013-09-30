require 'rubygems'
require 'dotenv'
require 'sass/plugin/rack'

Dotenv.load

require File.join(File.dirname(__FILE__), 'app/chitter.rb')

Sass::Plugin.options[:style] = :compressed
use Sass::Plugin::Rack

run Chitter