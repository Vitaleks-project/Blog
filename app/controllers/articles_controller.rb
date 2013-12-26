class ArticlesController < ApplicationController
  before_filter :authenticate_admin!, :except => [:new, :create, :show]
  before_filter :log_impression, :only=> [:show]

  def index
    if params[:disapproved]
      @articles = Article.disapproved.
                          order('created_at DESC').
                          paginate(:page => params[:page], :per_page => 10)
    else
      @articles = Article.order('created_at DESC').
                          paginate(:page => params[:page], :per_page => 10)
    end
  end

  def new
    @article = Article.new
  end

  def show
    @article = Article.find(params[:id])
    @comment = @article.comments.build
    @article.comments.pop
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    if user_signed_in?
        @article = Article.new(params[:article])
        @article.user_id = current_user.id
      if @article.save
        flash[:success] = "Article send to moderate. Thank."
        redirect_to root_path
      else
        render 'new'
      end
    elsif(admin_signed_in?)
      @article = Article.new(params[:article])
      @article.admin_id = current_admin.id
      @article.approved = true
      if @article.save
        flash[:success] = "Article created!"
        redirect_to articles_path
      else
        render 'new'
      end
    end
  end

  def update
    @article = Article.find(params[:id])
    params[:article] ||= {}
    params[:article][:approved] = params[:approved] if params[:approved]
    if @article.update_attributes(params[:article])
      flash[:success] = "Article updated."
      redirect_to articles_path
    else
      render 'edit'
    end
  end

  def destroy
    Article.find(params[:id]).destroy
    redirect_to articles_path
  end

  def log_impression
    @article = Article.find(params[:id])
    if admin_signed_in?
      @article.impressions.create(ip_address: request.remote_ip, user_id: current_admin.id)
    elsif user_signed_in?
      @article.impressions.create(ip_address: request.remote_ip, user_id: current_user.id)
    elsif(!user_signed_in? || !admin_signed_in?)
      @article.impressions.create(ip_address: nil, user_id: nil)
    end
  end
end
