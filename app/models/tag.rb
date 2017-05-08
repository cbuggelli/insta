class Tag < ApplicationRecord
  has_many :picture_tags
  has_many :pictures, through: :picture_tags

end
