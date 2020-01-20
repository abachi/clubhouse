class SessionsController < ApplicationController
  include SessionsHelper
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in user
      flash[:notice] = "Welcome, #{user.name}!"
      redirect_to posts_path
    else
      flash[:error] = 'Invalid email/password.'
      redirect_to login_path
    end
  end

  def destroy
    session.delete(:user_id)
    current_user = nil
    flash[:notice] = "Thanks for visiting us, See you later!"
    redirect_to root_url
  end
end
