json.hobby do 
  json.id post.id.to_s
  json.like_eat hobby.like_eat
  json.like_sport hobby.like_sport
end
json.tatal_count @total_count