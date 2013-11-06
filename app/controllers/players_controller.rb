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
    club_list
    @player = Player.new
  end

  def show
    @player = Player.find(params[:id])
  end

  def edit
  end

  def update
    club_list
    respond_to do |format|
      if @player.update_attributes(params[:player])
        format.html { redirect_to [@club,@player], notice: 'Player was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    club_list
    respond_to do |format|
      if @player.save
        format.html { redirect_to [@club,@player], notice: 'Player was successfully created.' }
        format.json { render json: @club, status: :created, location: @club }
      else
        format.html { render action: "new" }
        format.json { render json: @club.errors, status: :unprocessable_entity }
      end
    end
  end

  def club_list
    @club_list = Club.all
  end

  def destroy
    Player.find(params[:id]).destroy
    redirect_to :back
  end
end
