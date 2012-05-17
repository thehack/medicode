# User Authentication Views

get '/admin' do
  @title = "Medicode Administration Panel"
  erb :admin
end

post '/signup' do
    password = params[:password]
    email = params[:email]
    salt = Digest::SHA1.hexdigest("--#{Time.now.to_s}--#{email}--")
    company = Company.create(
    :company_name => params[:companyName],
    :first_name => params[:firstName],
    :last_name => params[:lastName],
    :email => email,
    :crypted_password => Digest::SHA1.hexdigest("--#{salt}--#{password}--"),
    :salt => salt,
    :created_on => Time.now,
    :updated_at => Time.now
    )
    #deliver a cookie which will expire one year from today.
    response.set_cookie("salt", :value => company.salt, :expires => (Time.new.gmtime + 60*60*24*360), :path => '/')
end

post '/login' do
  password = params[:loginPassword]
  email = params[:loginEmail]
  company = Company.first(:email => email)
  unless company.nil?
    salt = company.salt
    supplied_password_crypted = Digest::SHA1.hexdigest("--#{salt}--#{password}--")
  end
  if company.nil?
      flash[:notice] = "No such email."  
  elsif company.crypted_password == supplied_password_crypted
    response.set_cookie("salt", :value => company.salt, :expires => (Time.new.gmtime + 60*60*24*360), :path => '/')
  else
    flash[:notice] = "Access Denied: Incorrect Password."  
  end
end

