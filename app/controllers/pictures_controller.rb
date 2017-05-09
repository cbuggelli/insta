class PicturesController < ApplicationController

 def index
   @pictures = Picture.all
 end

 def new
   @picture = Picture.new
 end

 def create

   @picture = Picture.create(picture_params(:id,))
   byebug
   redirect_to new_picture_path(@picture) unless @picture.save
 end

 def show
   # byebug
   @picture = Picture.find(params[:id])
 end

 def destroy
   @picture.delete
 end

 private

 def picture_params (*args)
   params.require(:picture).permit(*args)

 end

end
