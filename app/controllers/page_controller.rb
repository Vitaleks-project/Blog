class PageController < ApplicationController
  def index
    if params[:tag]
      @posts = Post.tagged_with(params[:tag])
    else
      @posts = Post.order('created_at DESC').all
    end
  end
end
