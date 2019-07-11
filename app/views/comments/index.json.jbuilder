json.comment @comments do |comment|
  json.id comment.id.to_s
  json.post_comment comment.post_comment
  json.comment_like comment.likes
  
end
json.tatal_count @total_count