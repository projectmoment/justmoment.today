class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @post.comments.create(body: params[:comment_body], user_id: current_user.id)
  
    redirect_to :back
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to :back
  end
  
end
