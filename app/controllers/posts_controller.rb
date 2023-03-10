class PostsController < ApplicationController
  load_and_authorize_resource
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments)
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
    @comments = @post.comments
    @likes = @post.likes
  end

  def new
    @current_user = current_user
    @new_post = Post.new
  end

  def create
    @new_post = Post.new(post_params)
    @new_post.author = current_user

    if @new_post.save
      @new_post.update_post_counter
      flash[:notice] = 'successfully post.'
      redirect_to user_path(@new_post.author_id), notice: 'Post successfully'
    else
      render :new, alert: 'error'
    end
  end

  def destroy
    deleted_post = Post.find(params[:id])
    user = User.find(deleted_post.author_id)
    user.postsCounter -= 1
    deleted_post.destroy
    if user.save
      redirect_to user_path(params[:user_id]), notice: 'delete successfully'
    else
      render :new, alert: 'error at deleting post'
    end
  end


  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
