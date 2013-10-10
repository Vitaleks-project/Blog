class PageController < ApplicationController
  def index
    if params[:tag]
      @posts = Post.tagged_with(params[:tag]).paginate(:page => params[:page], :per_page => 4)
    else
      @posts = Post.order('created_at DESC').paginate(:page => params[:page], :per_page => 3)
    end
  end
end
