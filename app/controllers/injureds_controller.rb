class InjuredsController < ApplicationController
  before_filter :authenticate_admin!

  def index
    @injureds = Injured.order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
  end

  def new
    @injured = Injured.new
  end

  def edit
    @injured = Injured.find(params[:id])
  end

  def update
    @injured = Injured.find(params[:id])
    if @injured.update_attributes(params[:injured])
      flash[:success] = "Injured updated."
      redirect_to injureds_path
    else
      render 'edit'
    end
  end

  def create
    @injured = Injured.new(params[:injured])
    @injured.admin_id = current_admin.id
    if @injured.save
      flash[:success] = "Injured created!"
      redirect_to injureds_path
    else
      render 'new'
    end
  end

  def destroy
    Injured.find(params[:id]).destroy
    redirect_to injureds_path
  end

end
