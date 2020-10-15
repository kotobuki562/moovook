class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    render json:{text: @comment}
    if @comment.save
      # render json:{comment: @comment}
      # ActionCable.server.broadcast 'comment_channel', content: @comment
      # redirect_to post_path(@comment.post)
    else
      @post = @comment.post
      @comments = @post.comments
      render "posts/show"
    end
  end

  
  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end
