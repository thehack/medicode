DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/medicode.sqlite3")

class Company
  include DataMapper::Resource
  property :id, Serial
  property :company_name, String, :required => true
  property :first_name, String, :required => true
  property :last_name, String, :required => true
  property :email, String, :required => true
  property :crypted_password, String, :required => true
  property :salt, String, :required => true
  property :created_on, DateTime, :required => true
  property :updated_at, DateTime, :required => true
  has n, :profiles
end

class Profile
  include DataMapper::Resource
  property :id, Serial
  property :first_name, String, :required => true
  property :last_name, String, :required => true
  property :dob, String
  property :contact_first, String
  property :contact_last, String
  property :contact_number_1, Integer
  property :contact_number_2, Integer
  property :medical_history, Text
  property :blood_type, String
  property :allergies, Text
  property :medical_notes, Text
  property :created_on, DateTime
  property :updated_at, DateTime
  belongs_to :company
end

DataMapper.auto_upgrade!