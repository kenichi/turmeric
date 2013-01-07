class App < Sinatra::Base

  configure do
    set :root, Turmeric::ROOT
    if development?
      enable :reload_templates
      use Rack::ColorizedLogger do |logger|
        logger.public = 'public'
      end
    else
      use Rack::CommonLogger unless test?
    end
  end

  get '/?' do
    erb :index
  end

end
