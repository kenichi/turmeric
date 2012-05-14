desc 'load env'
task :env do
  require File.join File.dirname(__FILE__), 'env'
end

desc 'boot a fresh copy of tumeric into another dir'
task :boot, [:dir] => :env do |t, args|
  Dir.mkdir(args.dir) unless File.exist?(args.dir)
  exec %{rsync -ruv --exclude ".git" --exclude "Gemfile.lock" . #{args.dir}}
end
