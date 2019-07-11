json.comment do
  json.id @comment.id.to_s
  json.post_comment @comment.post_comment
  json.comment_like @comment.comment_like
  json.created_at @comment.created_at
  json.updated_at @comment.updated_at
end
