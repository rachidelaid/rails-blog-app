class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def posts
    @posts = Post.where(user_id: params[:user_id])
    @user = User.find(params[:user_id])
  end

  def post
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])
  end
end
