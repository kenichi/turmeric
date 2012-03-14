class App < Sinatra::Base

  configure do
    set :root, File.expand_path(File.dirname(__FILE__))
    enable :reload_templates
    use Rack::CommonLogger
    use Rack::ColorizedLogger
  end

  get '/?' do
    erb :index
  end

end
