class VotingsController < ApplicationController
  before_filter :authenticate_admin!

  def index
    @votings = Voting.all
  end

  def show
    @voting = Voting.find(params[:id])
    @question = @voting.questions.first
    @answer = @voting.questions.first.answers
  end

  def new
    @voting = Voting.new

    1.times do
      question = @voting.questions.build
      2.times { question.answers.build }
    end
  end

  def create
    @voting = Voting.new(params[:voting])
    @voting.admin_id = current_admin.id
    if @voting.save
      flash[:notice] = "Successfully created voting."
      redirect_to votings_path
    else
      render :action => 'new'
    end
  end

  def edit
    @voting = Voting.find(params[:id])
  end

  def update
    @voting = Voting.find(params[:id])
    if @voting.update_attributes(params[:voting])
      flash[:notice] = "Successfully updated voting."
      redirect_to votings_path
    else
      render :action => 'edit'
    end
  end

  def destroy
    @voting = Voting.find(params[:id]).destroy
    flash[:notice] = "Successfully destroyed voting."
    redirect_to voting_path
  end
end
