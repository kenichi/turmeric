ENV['RACK_ENV'] = 'test'
require File.join File.dirname(__FILE__), *%w[.. .. env]

require 'capybara/cucumber'
require 'selenium-webdriver'

config_ru = File.join File.dirname(__FILE__), *%w[.. .. config.ru]
Capybara.app = eval "Rack::Builder.new {(#{File.read config_ru})}"

Capybara.register_driver :chrome do |app|
    profile = Selenium::WebDriver::Chrome::Profile.new
      Capybara::Selenium::Driver.new(app, :browser => :chrome, :profile => profile)
end
Capybara.javascript_driver = :chrome

class AppWorld
  include Capybara::DSL
  include RSpec::Expectations
  include RSpec::Matchers
end

World do
  AppWorld.new
end
