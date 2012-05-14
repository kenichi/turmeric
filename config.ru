require File.join File.dirname(__FILE__), 'env'

favicon = ->(env){ [200, {'Content-Type' => 'text/plain'}, StringIO.new('')] }
map '/favicon.ico' do
  run favicon
end

map '/' do
  run App
end
