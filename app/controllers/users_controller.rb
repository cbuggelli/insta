class UsersController < ApplicationController

  def new
    @user = User.new

  end

  def create

    @user = User.create(user_params)
    # byebug
    if @user.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    # byebug
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
