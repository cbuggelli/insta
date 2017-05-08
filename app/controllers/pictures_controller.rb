class PicturesController < ApplicationController
  def new
    @picture = Picture.new

  end

  def create
    # byebug
    @picture = Picture.create(picture_params[:id])
    redirect_to new_picture_path(@picture) unless @picture.save
  end

  def show
    byebug
    @picture = Picture.find(params[:id])
  end

  def destroy
    @picture.delete
  end

  private

  def picture_params
    params.require(:picture).permit(:image_url, :title, :user_id)

  end

end
