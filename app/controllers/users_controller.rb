class UsersController < ApplicationController
  before_action :authorize_user, only: [:show]

  def new
    @user = User.new

  end

  def create

    @user = User.create(user_params)
    # byebug
    session[:user_id] = @user.id
    if @user.password == @user.password_confirmation && @user.save
      # @user.save
      redirect_to user_path(@user)
    else
      flash[:notice] = "Invalid credentials, please try again"
      redirect_to new_user_path
    end
  end

  def show
    # byebug
    @user = User.find(params[:id])
    @pictures = @user.pictures
  end

  def destroy
    @user.delete
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :email)

  end

end
