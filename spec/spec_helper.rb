ENV['RACK_ENV'] = 'test'
require File.join File.dirname(__FILE__), *%w[.. env]

RSpec.configure do |conf|
  conf.include Rack::Test::Methods
end

def app; App; end
