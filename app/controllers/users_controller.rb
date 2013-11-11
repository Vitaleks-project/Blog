class UsersController < ApplicationController
  def index
    if params[:search]
      @users = User.search(params[:search]).paginate(:page => params[:page])
      flash[:error] = "Not found." if params[:search] == ""
    else
      @users = User.order('created_at DESC').paginate(:page => params[:page], :per_page => 10)
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    params[:user] ||= {}
    params[:user][:banned] = params[:banned] if params[:banned]
    if @user.update_attributes(params[:user])
      flash[:success] = "User banned."
      redirect_to users_path
    end
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to users_path
  end
end
