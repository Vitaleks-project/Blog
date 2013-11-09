class PlayersController < ApplicationController
  before_filter :authenticate_admin!
  load_and_authorize_resource :club
  load_and_authorize_resource :player, :through => :club

  def index
    respond_to do |format|
      format.json { render json: @players }
    end
  end

  def new
    @player = Player.new
  end

  def show
    @player = Player.find(params[:id])
  end

  def edit
  end

  def update
    respond_to do |format|
      if @player.update_attributes(params[:player])
        format.html { redirect_to [@club], notice: "Player '#{@player.full_name}' for #{@club.clubname} was successfully updated." }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    respond_to do |format|
      if @player.save
        format.html { redirect_to [@club], notice: "Player for #{@club.clubname} was successfully created." }
        format.json { render json: @club, status: :created, location: @club }
      else
        format.html { render action: "new" }
        format.json { render json: @club.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    Player.find(params[:id]).destroy
    redirect_to :back
  end
end
