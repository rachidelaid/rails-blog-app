class PostsController < ApplicationController
  def index
    @posts = Post.where(author_id: params[:user_id])
    @user = User.find(params[:user_id])
  end

  def show
    @post = Post.find(params[:user_id])
    @user = User.find(@post.author_id)
  end

  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.new(allowed_params)
    if @post.save
      @post.update_counter(params[:user_id])
      redirect_to user_posts_path(@user.id)
    end
  end

  private

  def allowed_params
    params.require(:post).permit(:title, :text, :user_id)
  end
end