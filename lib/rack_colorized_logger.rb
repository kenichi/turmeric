module Rack
  class ColorizedLogger

    def initialize(app)
      @app = app
      @public = Dir[::File.join(App.root, 'public', '*')].map {|f| ::File.basename f}
    end

    def call env
      @request = Rack::Request.new(env)
      selected_paths = @public.select {|p| @request.path.index("\/#{p}") == 0}
      if selected_paths.empty?

        puts "path:".bold + " " + @request.path

        if defined? Rack::ColorizedLogger::CONFIG

          Rack::ColorizedLogger::CONFIG.each do |thing, color_a|
            puts "#{thing.to_s}:".send(color_a[0]).bold
            pretty_colors_h @request.send(thing), *color_a
          end

        else

          puts "params:".blue.bold
          pretty_colors_h @request.params, :blue, :red

          puts "session:".cyan.bold
          pretty_colors_h @request.session, :cyan, :yellow

          puts "cookies:".green.bold
          pretty_colors_h @request.cookies, :green, :magenta

        end

      end
      @app.call env
    end

    private

    def pretty_colors_h(hash, k_color, v_color = nil, padding = 1, start = true)
      v_color ||= k_color
      indent = padding + 1
      puts sprintf("%1$*2$s", "{", padding).blue if start
      hash.each do |k,v|
        if v.is_a?(Hash)
          puts sprintf("%1$*2$s","",indent) + "#{k.to_s.bold.send(k_color)} => " + "{".blue
          pretty_colors_h(v, k_color, v_color, padding+2, false)
        elsif v.is_a?(Array)
          puts sprintf("%1$*2$s","",indent) + "#{k.to_s.bold.send(k_color)} => " + pretty_colors_a(v, v_color)
        else
          puts sprintf("%1$*2$s","",indent) + "#{k.to_s.bold.send(k_color)} => #{v.to_s.bold.send(v_color)}"
        end
      end
      puts sprintf("%1$*2$s", "}", padding).blue
    end

    def pretty_colors_a(array, color)
      "[" + array.map {|e| e.is_a?(Hash) ? e.inspect.bold.send(color) : e.bold.send(color)}.join(",") + "]"
    end
  end
end
