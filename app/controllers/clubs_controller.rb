class ClubsController < ApplicationController
  before_filter :authenticate_admin!

  def index
    if params[:search]
      @clubs = Club.search(params[:search]).paginate(:page => params[:page])
      flash[:error] = "Not found." if params[:search] == ""
    else
      @clubs = Club.order('created_at DESC').paginate(:page => params[:page], :per_page => 10)
    end
  end

  def new
    @club = Club.new
  end

  def show
    @club = Club.find(params[:id])
  end

  def edit
    @club = Club.find(params[:id])
  end

  def update
    @club = Club.find(params[:id])
    if @club.update_attributes(params[:club])
      flash[:success] = "Club updated."
      redirect_to club_path
    else
      render 'edit'
    end
  end

  def create
    @club = current_admin.clubs.build(params[:club])
    if @club.save
      flash[:success] = "Club created!"
      redirect_to '/home'
    else
      render 'new'
    end
  end

  def destroy
    Club.find(params[:id]).destroy
    redirect_to :back
  end
end
