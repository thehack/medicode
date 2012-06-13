get '/profile/new' do
	@title = "Create A Medical Profile"
	erb :profile_new
end

get '/profile/:id/edit' do
  @title = "Edit Profile"
  @profile = Profile.get(params[:id].to_i)
  erb :profile_edit
end

get '/profile/:id/show' do
  @title = "Profile #{params[:id]}"
  @profile = Profile.get(params[:id].to_i)
  erb :profile_show, :layout => false
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
	profile = Profile.get(params[:id].to_i)
	profile.first_name = params[:firstName]
    profile.last_name = params[:lastName]
    profile.dob = params[:dob]
    profile.blood_type = params[:bloodType]
    profile.contact_first = params[:contactFirst]
    profile.contact_last = params[:contact_last]
    profile.contact_number_1 = params[:contactNumber1]
    profile.medical_history = params[:medicalHistory]
    profile.allergies = params[:allergies]
    profile.medical_notes = params[:medical_notes]
    profile.updated_at = Time.now
    profile.save
end

post '/profile/:id/destroy' do
	profile = Profile.get(params[:id].to_i)
	profile.destroy
end