class ClubsController < ApplicationController
  before_filter :authenticate_admin!

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
