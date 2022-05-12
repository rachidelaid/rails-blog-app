class Api::PostsController < ApplicationController
  def index
    @posts = Post.where(author_id: params[:user_id])

    if @posts.empty?
      json_response({ msg: 'no post or user found' }, 400)
    else
      render json: @posts
    end
  end
end
