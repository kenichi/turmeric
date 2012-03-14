require 'bundler'
Bundler.require(:default)

class ::String; include ::Term::ANSIColor; end

Dir['./lib/*.rb'].each {|f| require f}

require './app'

favicon = lambda {|env| [200, {'Content-Type' => 'text/plain'}, '']}
map '/favicon.ico' do
  run favicon
end

map '/' do
  run App
end
