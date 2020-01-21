class SessionsController < ApplicationController
  include SessionsHelper
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in user
      @current_user = user
      user.update_column(:remember_token, generate_token)
      cookies.permanent[:remember_token] = user.remember_token
      flash[:notice] = "Welcome, #{user.name}!"
      redirect_to posts_path
    else
      flash[:error] = 'Invalid email/password.'
      redirect_to login_path
    end
  end

  def destroy
    session.delete(:user_id)
    @current_user = nil
    cookies.delete(:remember_token)
    flash[:notice] = "Thanks for visiting us, See you later!"
    redirect_to root_url
  end
end
