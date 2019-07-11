require 'autoinc'
class Post
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Autoinc
  include Mongoid::Likeable

  field :title, type: String
  field :content, type: String
  field :writter, type: String
  field :number, type: Integer
  field :view_count, type: Integer, default: 0

  increments :number
  
  belongs_to :user
  has_many :comments
end