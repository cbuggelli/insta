class UsersController < ApplicationController
  before_action :authorize_user, only: [:show]

  def new
    @user = User.new

  end

  def create

    @user = User.create(user_params)
    # byebug
    session[:user_id] = @user.id
    if @user.save
      redirect_to user_path(@user)
    else
      render :new
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
