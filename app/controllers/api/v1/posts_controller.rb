class Api::V1::PostsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_post, only: %i[update destroy]

  def index
    render json: Post.all
  end

  def create
    @post = current_user.posts.create(post_params)
    render json: @post
  end

  def update
    @post.update(post_params)
    render json: @post
  end

  def destroy
    @post.destroy
  end

  private

  def set_post
    @post = Post.find_by(uuid: params[:uuid])
  end

  def post_params
    params.require(:post).permit(:id, :content)
  end
end
