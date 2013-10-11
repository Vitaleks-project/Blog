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

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      flash[:success] = "Post updated."
      redirect_to '/'
    else
      render 'edit'
    end
  end

  def destroy
    Post.find(params[:id]).destroy
    redirect_to :back
  end
end
