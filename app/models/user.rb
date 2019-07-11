class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include ActiveModel::SecurePassword

  paginates_per 5

  field :name, type: String
  field :age, type: Integer
  field :email, type: String
  field :password_digest, type: String
  field :address, type: String
  
  has_many :posts
  has_many :hobbies

  has_secure_password
end