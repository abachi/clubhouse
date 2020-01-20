class UsersController < ApplicationController

  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # authenticate the user and redirect user to the posts
      @user.authenticate
      rediect_to posts_path
    end
    render 'new'
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end

