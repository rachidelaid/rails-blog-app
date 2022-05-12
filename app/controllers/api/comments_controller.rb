class Api::CommentsController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    @comments = Comment.where(post_id: params[:post_id])

    if @comments.empty?
      json_response({ msg: 'No post, comments or user found' }, 400)
    else
      render json: @comments
    end
  end

  def create
    @comment = Comment.create!(comment_params)

    json_response(@comment, :created)
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :author_id, :post_id)
  end
end
