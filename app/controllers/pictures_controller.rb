class PicturesController < ApplicationController

 def index
   @pictures = Picture.all
 end

 def new
   @picture = Picture.new
 end

 def create
# byebug
   @picture = Picture.new(picture_params)
   @picture.user_id = current_user.id
   @picture.save

  #  @picture.id = picture_params[:id]

  #  redirect_to new_picture_path(@picture) unless @picture.save
   redirect_to picture_path(@picture)

 end

 def show
   # byebug
   @picture = Picture.find(params[:id])
 end

 def destroy
   @picture.delete
 end

 private

 def picture_params
   params.require(:picture).permit(:image_url, :title)

 end

end
