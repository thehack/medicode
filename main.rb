require 'sinatra'
require 'datamapper'
require 'digest/sha1' 
require 'sinatra/flash' #for flash-based sessions

enable :sessions

Dir['./app/**/*.rb'].each{ |f| require f } #Require controllers and models in app folder

# Authentication
before do

  def logged_in?
    client_id = request.cookies["salt"]
    if client_id.nil?
      return false
    else
      @company = Company.first(:salt => client_id) #if logged in views have access to @company.
      return true
    end
  end

  def authenticate!
    unless logged_in?
      flash[:notice] = "You must be a logged-in administrator to do that!"    
      redirect "/"
    end
  end

end

# and DRY protected access
before /^.*(new|edit|create|admin|destroy|upload|show)$/ do
  authenticate!
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
	erb :index, :layout => false
end


disable :logging #This was causing everything to output twice to console.
