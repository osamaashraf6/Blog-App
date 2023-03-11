class Api::PostsController < ApplicationController
  before_action :authorize_request
  def index
    @posts = Post.where(user_id: params[:user_id])
    if @posts.empty?
      json_response({ msg: 'Not found' }, 400)
    else
      render json: @posts
    end
  end
end
