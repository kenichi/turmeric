ENV['RACK_ENV'] = 'test'
require File.join File.dirname(__FILE__), *%w[.. .. env]

require 'capybara'
require 'capybara/cucumber'
require 'rspec'

config_ru = File.join File.dirname(__FILE__), *%w[.. .. config.ru]
Capybara.app = eval "Rack::Builder.new {(#{File.read config_ru})}"

class AppWorld
  include Capybara::DSL
  include RSpec::Expectations
  include RSpec::Matchers
end

World do
  AppWorld.new
end
