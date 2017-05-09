class SessionsController < ApplicationController
  before_action :logged_in?, except: [:new, :create]

  def new
  end

  def create
    @user = User.find_by(username: params[:user][:name])
    # byebug
    if !@user.nil? &&  @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:notice] = "We could not find your user name or password. Please try again."
      redirect_to login_path
    end
  end

  def destroy
    session.clear
    redirect_to login_path
  end

end
