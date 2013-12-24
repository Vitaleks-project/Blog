class ArticlesController < ApplicationController
  before_filter :authenticate_admin!, :except => [:new, :create, :show]

  def index
    @articles = Article.order('created_at DESC').
                        paginate(:page => params[:page], :per_page => 10)

    @approved_articles = Article.find_all_by_approved(true)
  end

  def new
    @article = Article.new
  end

  def show
    @article = Article.find(params[:id])
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
end
