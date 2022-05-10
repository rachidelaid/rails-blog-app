class CommentsController < ApplicationController
  load_and_authorize_resource except: :create

  def create
    @comment = Comment.new(
      text: allowed_params[:text],
      author_id: params[:user_id],
      post_id: params[:post_id]
    )
    if @comment.save
      @comment.comment_count(params[:post_id])
      redirect_to user_post_path(params[:user_id], params[:post_id])
    else
      redirect_to user_post_path(params[:user_id])
    end
  end

  def destroy
    @comment = Comment.find_by(id: params[:id])

    if @comment.destroy
      redirect_to user_post_path(params[:user_id], params[:post_id]), status: 303
      flash[:notice] = 'Successfully deleted comment.'
    else
      render :new
    end
  end

  private

  def allowed_params
    params.require(:comment).permit(:text)
  end
end
