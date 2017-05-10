class CommentsController < ApplicationController

  # @comments = Comment.all

  def new

  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = @current_user.id
    @comment.picture_id = params[:id]
    @comment.save

    redirect_to picture_path(@picture)


  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

end
