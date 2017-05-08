[1,2,3].each do |num|
  User.create(
    username:"user#{num}",
    email: "user#{num}@example.com",
    password: "test123"
  )
end

["Nature", "NYC", "Art", "Humor"].each do |tag_name|
  Tag.create(name: tag_name)
end

url = "http://www.defenders.org/sites/default/files/styles/large/public/dolphin-kristian-sekulic-isp.jpg"

url2 = "https://upload.wikimedia.org/wikipedia/commons/thumb/5/57/Water_buffaloes_in_Wuyishan_Wufu_2012.08.24_15-46-30.jpg/1024px-Water_buffaloes_in_Wuyishan_Wufu_2012.08.24_15-46-30.jpg"

Picture.create(
  image_url: url,
  title: "Saw a dolphin!",
  user_id: User.first.id
)

Picture.create(
  image_url: url2,
  title: "Water Buffalo!",
  user_id: User.first.id
)

Picture.create(
  image_url: url2,
  title: "Another Water Buffalo!",
  user_id: User.first.id
)

Picture.last.tags << Tag.second
Picture.first.tags << Tag.second
Picture.second.tags << Tag.first
