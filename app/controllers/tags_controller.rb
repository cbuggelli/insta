class TagsController < ApplicationController
  def new

  end

  def create
    @tag = Tag.create(name: tag_params[:name])
    @picture = Picture.find(params[:picture_id])
    @picture.tags << @tag
    # byebug
    redirect_to picture_path(@picture)
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end

end
