class CommentsController < ApplicationController
  def new
    @current_user = current_user
    @new_comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @new_comment = Comment.create(comment_params)
    @new_comment.author = current_user
    @new_comment.post = @post

    if @new_comment.save
      @new_comment.update_comment_counter
      redirect_to user_post_path(current_user.id, @post.id)
    else
      render :new, alert: 'error'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
