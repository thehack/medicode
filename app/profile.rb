get '/profile/new' do
	@title = "Create A Medical Profile"
	erb :profile_new
end

get '/profile/edit' do
  @title = "Edit Profile"
  erb :profile_edit
end

get '/profile/:id/show' do
  @title = "Profile #{params[:id]}"
  erb :profile_show
end

post '/profile/create' do
	profile = Profile.create(
	    :first_name => params[:firstName],
	    :last_name => params[:lastName],
	    :dob => params[:dob],
	    :blood_type => params[:bloodType],
	    :contact_first => params[:contactFirst],
	    :contact_last => params[:contact_last],
	    :contact_number_1 => params[:contactNumber1],
	    :medical_history => params[:medicalHistory],
	    :allergies => params[:allergies],
	    :medical_notes => params[:medical_notes],
	    :created_on => Time.now,
	    :updated_at => Time.now
    )
    @company.profiles << profile
    @company.save
end

post '/profile/:id/update' do
	profile = Profile.get(params[:id])
end

post '/profile/:id/destroy' do
	profile = Profile.get(params[:id].to_i)
	profile.destroy
end