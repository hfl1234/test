json.extract! comment, :id, :post_comment, :location, :comment_like, :created_at, :updated_at
json.url comment_url(comment, format: :json)
