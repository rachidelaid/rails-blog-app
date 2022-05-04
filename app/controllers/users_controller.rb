class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def posts
    @posts = Post.where(author_id: params[:id])
    @user = User.find(params[:id])
  end

  def post
    @post = Post.find(params[:id])
  end
end
