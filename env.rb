module Tumeric
  ROOT = File.dirname __FILE__
  LIB_DIR = File.join ROOT, 'lib'
  APP_FILE = File.join ROOT, 'app'
end

ENV['RACK_ENV'] ||= 'development'
require 'stringio'
require 'bundler'
Bundler.require :default, ENV['RACK_ENV'].to_sym

Dir[File.join(Tumeric::LIB_DIR, '*.rb')].each {|f| require f}
require Tumeric::APP_FILE

class ::String; include ::Term::ANSIColor; end
