class Hobby
  include Mongoid::Document
  include Mongoid::Timestamps

  field :like_eat, type: String
  field :like_sport, type: String
  field :writter, type: String

  belongs_to :user
end