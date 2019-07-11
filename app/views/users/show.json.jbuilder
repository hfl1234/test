json.user do
  json.id @user.id.to_s
  json.name @user.name
  json.age @user.age
  json.address @user.address
  json.email @user.email]
  json.created_at @user.created_at
  json.updated_at @user.updated_at
end


