class UsersController < ApplicationController
  def index
    @users = User.order('created_at DESC').paginate(:page => params[:page], :per_page => 10)
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to :back
  end
end
