class GamesController < ApplicationController
  before_filter :authenticate_admin!

  def index
    @games = Game.order("created_at DESC").all
  end

  def new
    @game = Game.new
  end

  def edit
    @game = Game.find(params[:id])
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

  def update
    @game = Game.find(params[:id])
    if @game.update_attributes(params[:game])
      flash[:success] = "Game updated."
      redirect_to games_path
    else
      render 'edit'
    end
  end

  def destroy
    Game.find(params[:id]).destroy
    redirect_to games_path
  end
end
