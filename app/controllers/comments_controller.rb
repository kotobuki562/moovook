class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    render json:{text: @comment}
    unless  @comment.save
      @post = @comment.post
      @comments = @post.comments
      render "posts/show"
    end
  end

  
  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, post_id: params[:post_id],user_name: current_user.name)
  end
end
