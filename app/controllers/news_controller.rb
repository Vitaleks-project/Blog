class NewsController < ApplicationController
  before_filter :authenticate_admin!

  def index
    @news = News.order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
  end

  def new
    @new = News.new
  end

  def edit
    @new = News.find(params[:id])
  end

  def update
    @new = News.find(params[:id])
    if @new.update_attributes(params[:news])
      flash[:success] = "News updated."
      redirect_to news_index_path
    else
      render 'edit'
    end
  end

  def create
    @new = News.new(params[:news])
    @new.admin_id = current_admin.id
    if @new.save
      flash[:success] = "News created!"
      redirect_to news_index_path
    else
      render 'new'
    end
  end

  def destroy
    News.find(params[:id]).destroy
    redirect_to news_index_path
  end
end
