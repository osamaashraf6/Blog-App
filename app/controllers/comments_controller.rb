class Api::CommentsController < ApplicationController
  before_action :authorize_request
  protect_from_forgery with: :null_session

  def index
    @comments = Comment.where(post_id: params[:post_id])

    if @comments.empty?
      json_response({ msg: 'Not found' }, 400)
    else
      render json: @comments
    end
  end

  def create
    @comment = Comment.create(
      text: comment_params[:text],
      user_id: params[:user_id],
      post_id: params[:post_id]
    )

    json_response(@comment, :created)
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end