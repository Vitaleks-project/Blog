class PlayersController < ApplicationController
  before_filter :authenticate_admin!

  def index
    @players = Player.order('created_at DESC').paginate(:page => params[:page], :per_page => 10)
  end

  def new
    club_list
    @player = Player.new
  end

  def show
    @player = Player.find(params[:id])
  end

  def edit
    @player = Player.find(params[:id])
  end

  def update
    @player = Player.find(params[:id])
    if @player.update_attributes(params[:player])
      flash[:success] = "Player updated."
      redirect_to players_path
    else
      render 'edit'
    end
  end

  def create
    club_list
    @player = current_admin.players.build(params[:player])
    if @player.save
      flash[:success] = "Player created!"
      redirect_to players_path
    else
      render 'new'
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
