class Picture < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :picture_tags
  has_many :tags, through: :picture_tags

  validates :image_url, allow_blank: false, format: { with: %r{.(gif|jpg|jpeg|png|bmp)\Z}i, message: 'must be a URL for GIF, JPG or PNG image.' }

  def self.hot_pics
    pics = Picture.all.reverse
  end

end
