require 'spec_helper'

describe ClubsController do

  before(:each) do
    sign_in(@user = FactoryGirl.create(:admin))
  end

  def valid_attributes
    {
        clubname: "Manchester United",
        stadiumname: "Old Trafford",
        coach: "D.Moyes",
        year_of_foundation: '1898-10-10',
        uniq_title: "MU",
        description: "Glory, Glory Man United",
        admin_id: 1
    }
  end

  describe "GET index" do
    it "Index" do
      club = Club.create! valid_attributes
      get :index, {}
      assigns(:clubs).should eq([club])
    end
  end

  describe "GET show" do
    it "Show" do
      club = Club.create! valid_attributes
      get :show, {:id => club.to_param}
      assigns(:club).should eq(club)
    end
  end

  describe "GET edit" do
    it "Edit" do
      club = Club.create! valid_attributes
      get :edit, {:id => club.to_param}
      assigns(:club).should eq(club)
    end
  end

  describe "POST create" do
    describe "valid" do
      it "creates a new Club" do
        expect {
          post :create, {:club => valid_attributes}
        }.to change(Club, :count).by(1)
      end

      it "assigns a newly created club as @club" do
        post :create, {:club => valid_attributes}
        assigns(:club).should be_a(Club)
        assigns(:club).should be_persisted
      end

      it "redirects to the created club" do
        post :create, {:club => valid_attributes}
        response.should redirect_to(clubs_path)
      end
    end

    describe "Invalid" do
      it "assigns a newly created but unsaved club as @club" do
        Club.any_instance.stub(:save).and_return(false)
        post :create, {:club => { "clubname" => "" }}
        assigns(:club).should be_a_new(Club)
      end

      it "re-renders the 'new' template" do
        Club.any_instance.stub(:save).and_return(false)
        post :create, {:club => { "clubname" => "" }}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "Valid" do
      it "updates Club" do
        club = Club.create! valid_attributes
        Club.any_instance.should_receive(:update_attributes).with({ "clubname" => "Chelsea" })
        put :update, {:id => club.to_param, :club => { "clubname" => "Chelsea" }}
      end

      it "assigns the requested club as @club" do
        club = Club.create! valid_attributes
        put :update, {:id => club.to_param, :club => valid_attributes}
        assigns(:club).should eq(club)
      end

      it "redirects to the club" do
        club = Club.create! valid_attributes
        put :update, {:id => club.to_param, :club => valid_attributes}
        response.should redirect_to(club)
      end
    end

    describe "Invalid" do
      it "assigns the club as @club" do
        club = Club.create! valid_attributes
        Club.any_instance.stub(:save).and_return(false)
        put :update, {:id => club.to_param, :club => { "clubname" => "" }}
        assigns(:club).should eq(club)
      end

      it "re-renders the 'edit' template" do
        club = Club.create! valid_attributes
        Club.any_instance.stub(:save).and_return(false)
        put :update, {:id => club.to_param, :club => { "clubname" => "" }}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "Destroy" do
      club = Club.create! valid_attributes
      expect {
        delete :destroy, {:id => club.to_param}
      }.to change(Club, :count).by(-1)
    end
  end
end
