class Tag < ApplicationRecord
  has_many :picture_tags
  has_many :picture_tags
  has_many :pictures, through: :picture_tags

  def self.most_popular
    pop_tag = Tag.all.sort_by do |tag|
      tag.pictures.length
    end
    pop_tag[-3..-1]
  end

  def self.trending
    last_ten = Picture.find(:all, :order => "id desc", :limit => 10).reverse

    top_comments = last_ten.sort_by do |picture|
      picture.comments.length
    end
    top_comments.tags[-1]
  end
end
