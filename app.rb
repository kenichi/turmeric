class App < Sinatra::Base

  configure do
    set :root, Tumeric::ROOT
    use Rack::CommonLogger
    if development?
      enable :reload_templates
      use Rack::ColorizedLogger
    end
  end

  get '/?' do
    erb :index
  end

end
