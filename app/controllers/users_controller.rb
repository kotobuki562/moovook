class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order('created_at DESC').page(params[:page]).per(6)
    @likes = Like.where(user_id: @user.id)
  end
end
