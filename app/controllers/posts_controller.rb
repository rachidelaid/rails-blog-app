class PostsController < ApplicationController
  def index
    @posts = Post.where(author_id: params[:user_id])
    @user = User.find(params[:user_id])
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])
  end

  def new
    @post = Post.new
    @user = User.find(params[:user_id])
  end

  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.new(allowed_params)
    @post.update_counter(params[:user_id]) if @post.save
    redirect_to user_posts_path(@user.id)
  end

  private

  def allowed_params
    params.require(:post).permit(:title, :text, :user_id)
  end
end
