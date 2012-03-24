require 'sinatra'
require 'datamapper'
require 'digest/sha1' 
require 'sinatra/flash' #for flash-based sessions

enable :sessions

Dir['./app/**/*.rb'].each{ |f| require f } #Require controllers and models in app folder

# a good place for authentication
before do

end

helpers do
  include Rack::Utils
  # Make sure our template can use <%=h %>
  alias_method :h, :escape_html
  # Partials: Usage: partial :foo
  def partial(page, options={})
    erb page, options.merge!(:layout => false)
  end
end

get '/' do
  @title = "Medicode: Life-saving information when seconds count. splash-page, sign-up or register interest."
  erb :index
end

disable :logging #This was causing everything to output twice to console.
