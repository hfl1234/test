json.hobbies @hobbies do |hobby|
  json.id hobby.id.to_s
  json.like_eat hobby.like_eat
  json.like_sport hobby.like_sport
  json.writter hobby.writter
end
json.tatal_count @total_count