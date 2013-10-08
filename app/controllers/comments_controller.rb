class CommentsController < ApplicationController

  def create
    @commentable = Comment.find_commentable(params[:comment][:commentable_type], params[:comment][:commentable_id])
    if @commentable
      @comment = @commentable.comments.build(params[:comment])
      if @comment.save
        redirect_to :back, :notice => "Thanks for the comment."
      else
        flash.now[:alert] = "You had some errors for your comment."
        redirect_to :back
      end
    else
      redirect_to root_url, :alert => "You can't do that."
    end
  end
end