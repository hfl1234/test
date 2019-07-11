require 'autoinc'
class Comment
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Autoinc
  include Mongoid::Likeable

  field :post_comment, type: String
  field :comment_like, type: Integer, default: 0
  field :not_like, type: Integer
  field :post_title, type: String
  field :location, type: Integer
  
  increments :location, scope: :post_id
  belongs_to :post
end