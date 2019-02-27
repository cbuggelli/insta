class User < ApplicationRecord
  has_secure_password
  has_many :pictures
  has_many :comments
  has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                  foreign_key: "followed_id",
                                  dependent:   :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  
  validates :username, presence: true
  validates :password, presence: true
  validates :email, presence: true
  validates_format_of :email, :with => /@/

  def received_comments
    user_pictures = @user.picture.map do |picture|
      picture.comments
    end
  end

  def follow(other_user)
    following << other_user
  end

  def unfollow(other_user)
    following.delete(other_user)
  end

  def following?(other_user)
    following.include?(other_user)
  end

end
