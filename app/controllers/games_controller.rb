class GamesController < ApplicationController
  before_filter :authenticate_admin!
  load_and_authorize_resource :season
  load_and_authorize_resource :game, :through => :season

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
    @game.admin_id = current_admin.id
    respond_to do |format|
      if @game.save
        format.html { redirect_to [@season], notice: 'Game created!' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    params[:game] ||= {}
    params[:game][:done] = params[:done] if params[:done]
    respond_to do |format|
      if @game.update_attributes(params[:game])
        format.html { redirect_to [@season], notice: "Game for was successfully updated." }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    Game.find(params[:id]).destroy
    redirect_to :back
  end
end
