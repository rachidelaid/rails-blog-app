class PostsController < ApplicationController
  load_and_authorize_resource except: :create

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments)
  end

  def show
    @post = Post.find_by(id: params[:id])
    @user = User.find(params[:user_id])
  end

  def new
    @post = Post.new
    @user = User.find(params[:user_id])
  end

  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.new(allowed_params)
    # @post = @user.posts.new(
    #   title: allowed_params[:title],
    #   text: allowed_params[:text],
    #   author_id: allowed_params[:user_id],
    #   comments_counter: 0,
    #   likes_counter: 0
    # )
    @post.author_id = params[:user_id]
    if @post.save
      @post.update_counter(params[:user_id])
      redirect_to user_posts_path(@user.id)
      flash[:notice] = 'Your post was successfully created'
    else
      redirect_to new_user_post_path(@user.id)
      flash[:notice] = 'An error has occurred while creating the post'
    end
  end

  def destroy
    @post = Post.find(params[:id])

    if @post.destroy
      @post.update_counter(params[:user_id])
      redirect_to root_path, status: 303
      flash[:notice] = 'post deleted successfully'
    else
      render :new
    end
  end

  private

  def allowed_params
    params.require(:post).permit(:title, :text)
  end
end
