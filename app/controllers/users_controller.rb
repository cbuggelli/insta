class UsersController < ApplicationController

  def new
    @user = User.new

  end

  def create
    # byebug
    @user = User.create(user_params[:id])
    redirect_to user_path(@user) unless @user.save
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user.delete
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :email)

  end

end
