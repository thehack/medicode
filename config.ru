#ENV['GEM_HOME'] ||= `gem env path`.strip.split(':').first
#ENV['GEM_PATH'] ||= `gem env path`.strip
#Gem.clear_paths

require './main.rb'
set :environment, :development
run Sinatra::Application
