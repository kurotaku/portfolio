class Api::V1::PostsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render json: Post.all
  end

  def create
    post = current_user.posts.create(post_params)
    render json: post
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    render json: post
  end

  def destroy
    Post.destory(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:id, :content)
  end
end
