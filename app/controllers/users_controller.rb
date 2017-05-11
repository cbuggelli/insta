class UsersController < ApplicationController
  before_action :authorize_user, only: [:show]

  def new
    @user = User.new
  end

  def create
    if (user_params[:password] != user_params[:password_confirmation])
      flash[:notice] = "Password does not match confirmation, please try again"
    end

    @user = User.new(user_params)
    
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:notice] = "Invalid credentials, please try again"
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find(params[:id])
    @pictures = @user.pictures
  end

  def destroy
    @user.delete
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :email)
  end

end
