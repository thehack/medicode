DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/medicode.sqlite3")

class Company
  include DataMapper::Resource
  property :id, Serial
  property :administrator, String
  property :email, String
  property :name, String, :required => true
  property :logo, String
  property :color1, String
  property :color2, String
  property :color3, String
  property :color4, String
  property :color5, String
  property :color6, String
  property :created_on, DateTime
  property :updated_at, DateTime
  has n, :users
end

class User
  include DataMapper::Resource
  property :id, Serial
  property :first_name, String
  property :last_name, String
  property :dob, DateTime
  property :contact_first, String
  property :contact_last, String
  property :contact_number_1, Integer
  property :contact_number_2, Integer
  property :medical_history, Text
  property :blood_type, String
  property :allergies, Text
  property :created_on, DateTime
  property :updated_at, DateTime
  belongs_to :company
end

DataMapper.auto_upgrade!