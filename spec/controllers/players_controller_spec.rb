require 'spec_helper'

describe PlayersController do

  before(:each) do
    sign_in(@user = FactoryGirl.create(:admin))
  end

  def valid_attributes
    {
        first_name: "Cristiano",
        last_name: "Ronaldo",
        birthday: "10-15-1988",
        country: "Portugal",
        club: "Real Madrid",
        admin_id: 1,
        position: "ФРВ",
        number: 7
    }
  end

  before(:all) do
    @club = FactoryGirl.create(:club)
  end

  after(:all) do
    @club.destroy
  end

  describe "GET index" do
    it "Index" do
      player = FactoryGirl.create(:player, valid_attributes.merge(club: @club))
      get :index, {:club_id => @club.to_param}
      assigns(:players).should eq([player])
    end
  end

  describe "GET show" do
    it "Show" do
      player = FactoryGirl.create(:player, valid_attributes.merge(club: @club))
      get :show, {:club_id => @club.to_param, :id => player.to_param}
      assigns(:player).should eq(player)
    end
  end

  describe "GET new" do
    it "New" do
      get :new, {:club_id => @club.to_param}
      assigns(:player).should be_a_new(Player)
    end
  end

  describe "GET edit" do
    it "Edit" do
      player = FactoryGirl.create(:player, valid_attributes.merge(club: @club))
      get :edit, {:club_id => @club.to_param, :id => player.to_param}
      assigns(:player).should eq(player)
    end
  end

  describe "DELETE destroy" do
    it "Destroy" do
      player = FactoryGirl.create(:player, valid_attributes.merge(club: @club))
      expect {
        delete :destroy, {:club_id => @club.to_param, :id => player.to_param}
      }.to change(Player, :count).by(-1)
    end
  end
end
