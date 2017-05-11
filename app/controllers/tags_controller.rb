class TagsController < ApplicationController
  def new

  end

  def create
    @tag = Tag.create(name: tag_params[:name])
    @picture = Picture.find(params[:picture_id])
    @picture.tags << @tag
    redirect_to picture_path(@picture)
  end

  def show
    @tag = Tag.find(params[:id])

  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end

end
