json.posts @posts do |post|
  json.id post.id.to_s
  json.title post.title
  json.content post.content
  json.view_count post.view_count
  json.writter post.writter
  json.like post.likes
end
json.tatal_count @total_count