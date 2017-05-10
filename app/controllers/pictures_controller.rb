class PicturesController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:index,:show]

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

   @picture = Picture.find(params[:id])
   @comment = Comment.new
   @tag = Tag.new
   @picture_tag = PictureTag.create(tag_id: @tag.id, picture_id: @picture.id)
  #  byebug
 end

 def edit
   @picture = Picture.find(params[:id])
   if @picture.user.id != current_user.id
     redirect_to user_path(current_user)
   end
 end

 def update
   @picture = Picture.find(params[:id])
   @picture.update(picture_params)
   redirect_to picture_path(@picture.id)
 end


 def destroy
   @picture.delete
 end

 private

 def picture_params
   params.require(:picture).permit(:image_url, :title)

 end

 def require_login
    return head(:forbidden) unless session.include? :user_id
  end

end
