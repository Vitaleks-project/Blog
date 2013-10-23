class AdminController < ApplicationController
  before_filter :authenticate_admin!
  def home
    @admins = Admin.order('created_at DESC').paginate(:page => params[:page], :per_page => 10)
  end
end
