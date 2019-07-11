json.post do
  json.id @post.id.to_s
  json.title @post.title
  json.content @post.content
  json.writter @post.writter
  json.view_count @post.view_count
  json.like @post.likes
  json.created_at @post.created_at
  json.updated_at @post.updated_at
end
