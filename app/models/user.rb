class User < ApplicationRecord
  has_many :pictures
  has_many :comments

  def received_comments
    user_pictures = @user.picture.map do |picture|
      picture.comments
    end

  end

end
