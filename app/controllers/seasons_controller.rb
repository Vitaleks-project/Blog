class SeasonsController < ApplicationController
  before_filter :authenticate_admin!, :except => [:show, :index]

  def index
    @seasons = Season.all
  end

  def show
    @season = Season.find(params[:id])
  end

  def new
    @season = Season.new
  end

  def edit
    @season = Season.find(params[:id])
  end

  def create
    @season = Season.new(params[:season])
    @season.admin_id = current_admin.id

    if @season.save
      redirect_to seasons_path, notice: 'Season was successfully created.'
    else
      render "new"
    end
  end

  def update
    @season = Season.find(params[:id])
    if @season.update_attributes(params[:season])
      redirect_to @season, notice: 'Season was successfully updated.'
    else
      render "edit"
    end
  end

  def destroy
    Season.find(params[:id]).destroy

    redirect_to seasons_path
  end
end
