json.users @users do |user|
  json.id user.id.to_s
  json.name user.name
  json.age user.age
  json.email user.email
  json.password user.password_digest
  json.created_at user.created_at
  json.updated_at user.updated_at
end
json.tatal_count @users.total_count
json.current_page @users.current_page