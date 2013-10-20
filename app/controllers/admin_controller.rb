class AdminController < ApplicationController
  before_filter :authenticate_admin!
  def home
    @users = User.all
    @posts = Post.order('created_at DESC').paginate(:page => params[:page], :per_page => 10)
  end
end
