# Users
User.create!(username:  "Example User",
             email: "example@instr.org",
             password:              "foobar",
             password_confirmation: "foobar",
             profile_pic: "https://www.merriam-webster.com/assets/mw/images/article/art-wap-article-main/egg-3442-e1f6463624338504cd021bf23aef8441@1x.jpg"
)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@instr.org"
  password = "password"
  User.create!(username:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               profile_pic: "https://www.merriam-webster.com/assets/mw/images/article/art-wap-article-main/egg-3442-e1f6463624338504cd021bf23aef8441@1x.jpg"
  )

end

# Pictures
users = User.order(:created_at).take(6)
50.times do
  img = "https://ichef.bbci.co.uk/news/660/media/images/75471000/jpg/_75471932_ed3c_2016.jpg"
  users.each { |user| user.pictures.create!(image_url: img, title: "tigers") }
end

# Following relationships
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }