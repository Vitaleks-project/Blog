require 'spec_helper'

describe InjuredsController do

  before(:each) do
    sign_in(@user = FactoryGirl.create(:admin))
  end

  def valid_attributes
    {
        injurious: "Foot",
        date_and: 1898-10-10,
        player_name: "Rooney"
    }
  end

  describe "GET index" do
    it "Index" do
      injured = Injured.create! valid_attributes
      get :index, {}
      assigns(:injureds).should eq([injured])
    end
  end

  describe "GET edit" do
    it "Edit" do
      injured = Injured.create! valid_attributes
      get :edit, {:id => injured.to_param}
      assigns(:injured).should eq(injured)
    end
  end

  describe "POST create" do
    describe "valid" do
      it "creates a new Injured" do
        expect {
          post :create, {:injured => valid_attributes}
        }.to change(Injured, :count).by(1)
      end

      it "assigns a newly created injured as @injured" do
        post :create, {:injured => valid_attributes}
        assigns(:injured).should be_a(Injured)
        assigns(:injured).should be_persisted
      end

      it "redirects to the created injured" do
        post :create, {:injured => valid_attributes}
        response.should redirect_to(injureds_path)
      end
    end

    describe "Invalid" do
      it "assigns a newly created but unsaved injured as @injured" do
        Injured.any_instance.stub(:save).and_return(false)
        post :create, {:injured => { "player_name" => "" }}
        assigns(:injured).should be_a_new(Injured)
      end

      it "re-renders the 'new' template" do
        Injured.any_instance.stub(:save).and_return(false)
        post :create, {:injured => { "player_name" => "" }}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "Valid" do
      it "updates Injured" do
        injured = Injured.create! valid_attributes
        Injured.any_instance.should_receive(:update_attributes).with({ "player_name" => "Rooney" })
        put :update, {:id => injured.to_param, :injured => { "player_name" => "Rooney" }}
      end

      it "assigns the requested injured as @injured" do
        injured = Injured.create! valid_attributes
        put :update, {:id => injured.to_param, :club => valid_attributes}
        assigns(:injured).should eq(injured)
      end

      it "redirects to the injured" do
        injured = Injured.create! valid_attributes
        put :update, {:id => injured.to_param, :injured => valid_attributes}
        response.should redirect_to(injureds_path)
      end
    end

    describe "Invalid" do
      it "assigns the injured as @injured" do
        injured = Injured.create! valid_attributes
        Injured.any_instance.stub(:save).and_return(false)
        put :update, {:id => injured.to_param, :club => { "player_name" => "" }}
        assigns(:injured).should eq(injured)
      end

      it "re-renders the 'edit' template" do
        injured = Injured.create! valid_attributes
        Injured.any_instance.stub(:save).and_return(false)
        put :update, {:id => injured.to_param, :club => { "player_name" => "" }}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "Destroy" do
      injured = Injured.create! valid_attributes
      expect {
        delete :destroy, {:id => injured.to_param}
      }.to change(Injured, :count).by(-1)
    end
  end
end
