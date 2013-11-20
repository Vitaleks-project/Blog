class GamesController < ApplicationController
  before_filter :authenticate_admin!

  def index
    @games = Game.all
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(params[:game])
    @game.admin_id = current_admin.id
    if @game.save
      flash[:success] = "Game created!"
      redirect_to games_path
    else
      render 'new'
    end
  end

  def destroy
    Game.find(params[:id]).destroy
    redirect_to games_path
  end
end
