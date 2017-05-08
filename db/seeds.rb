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

Picture.create(
  image_url: url,
  title: "Saw a dolphin!",
  user_id: User.first.id
)
