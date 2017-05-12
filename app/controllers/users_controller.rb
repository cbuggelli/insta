class UsersController < ApplicationController
  before_action :authorize_user, only: [:show]

  def new
    @user = User.new
  end

  def create
    if params[:user][:password] == params[:user][:password_confirmation]
      @user = User.new(user_params)
      @user.save
    if @user.valid?
      # @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:notice] = "Invalid credentials!, please try again"
      redirect_to new_user_path
    end
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

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if params[:user][:password] == params[:user][:password_confirmation] && params[:user][:password] != ""
      @user = User.update(user_params)
      redirect_to user_path(@user)
    else
      redirect_to edit_user_path(@user)
    end
  end

  def destroy
    @user.delete
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :email, :profile_pic)
  end

end
