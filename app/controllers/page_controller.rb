class PageController < ApplicationController
  def index
    if params[:tag]
      @posts = Post.tagged_with(params[:tag]).paginate(:page => params[:page], :per_page => 7)
    else
      @posts = Post.order('created_at DESC').paginate(:page => params[:page], :per_page => 7)
    end

    if params[:search]
      @posts = Post.search(params[:search]).paginate(:page => params[:page])
      flash[:error] = "Not found." if params[:search] == ""
    else
      @posts = Post.order('created_at DESC').paginate(:page => params[:page], :per_page => 10)
    end
  end
end
