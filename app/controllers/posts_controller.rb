class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
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

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
