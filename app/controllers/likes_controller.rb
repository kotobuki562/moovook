class LikesController < ApplicationController
  before_action :post_params

  def create
    @posts = Post.includes(:user).order('created_at DESC')
    Like.create(user_id: current_user.id, post_id: params[:id])
    # redirect_to root_path
  end

  def destroy
    @posts = Post.includes(:user).order('created_at DESC')
    Like.find_by(user_id: current_user.id, post_id: params[:id]).destroy
    # redirect_to root_path
  end

  private

  def post_params
    @post = Post.find(params[:id])
  end
end
