class PostsController < ApplicationController
  before_filter :authenticate_admin!, :only => [:create, :destroy, :new]

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @comment = @post.comments.build
    @post.comments.pop
  end

  def create
    @post = current_admin.posts.build(params[:post])
    if @post.save
      flash[:success] = "Post created!"
      redirect_to '/home'
    else
      render 'new'
    end
  end

  def destroy
    Post.find(params[:id]).destroy
    redirect_to :back
  end
end
