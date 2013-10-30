class PostsController < ApplicationController
  before_filter :authenticate_admin!, :only => [:create, :destroy, :new]
  before_filter :log_impression, :only=> [:show]

  def index
    if params[:search]
      @posts = Post.search(params[:search]).paginate(:page => params[:page])
      flash[:error] = "Not found." if params[:search] == ""
    else
      @posts = Post.order('created_at DESC').paginate(:page => params[:page], :per_page => 10)
    end
  end
  def new
    @post = Post.new
    club_list
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
    club_list
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

  def club_list
    @club_list = Club.all
  end

  def log_impression
    @post = Post.find(params[:id])
    if admin_signed_in?
      @post.impressions.create(ip_address: request.remote_ip, user_id: current_admin.id)
    elsif user_signed_in?
      @post.impressions.create(ip_address: request.remote_ip, user_id: current_user.id)
    elsif(!user_signed_in? || !admin_signed_in?)
      @post.impressions.create(ip_address: nil, user_id: nil)
    end
  end
end
