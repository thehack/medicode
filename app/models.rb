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
  property :created_on, DateTime
  property :updated_at, DateTime
  belongs_to :company
end

DataMapper.auto_upgrade!