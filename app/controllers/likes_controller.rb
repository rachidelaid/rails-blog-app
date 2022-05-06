class LikesController < ApplicationController
  def new
    @like = Like.new
  end

  def create
    @like = current_user.likes.new(
      author_id: params[:user_id],
      post_id: params[:post_id]
    )
    if @like.save
      @like.like_count(params[:post_id])
      redirect_to user_post_path(params[:user_id], params[:post_id])
    end
  end
end