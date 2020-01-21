class PostsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create]

  def new
    @post = Post.new
  end

  def index
    @posts = Post.all.sort{|a,b| b.created_at <=> a.created_at }
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] = 'Post created!'
      redirect_to posts_path
    else
      render 'new'
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end
  
  def logged_in_user
    unless logged_in?
      flash[:notice] = 'Please login.'
      redirect_to login_path
    end
  end

end
