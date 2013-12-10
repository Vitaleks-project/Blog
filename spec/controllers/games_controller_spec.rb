require 'spec_helper'

describe GamesController do

  before(:each) do
    sign_in(@user = FactoryGirl.create(:admin))
  end

  def valid_attributes
    @club1 = FactoryGirl.create(:club)
    @club2 = FactoryGirl.create(:club)
    {
        admin_id: 1,
        location: "Home",
        date: 1898-10-10,
        kind: "Premier League",
        club_ids: [@club1.id, @club2.id]
    }
  end

  describe "GET index" do
    it "Index" do
      game = Game.create! valid_attributes
      get :index, {}
      assigns(:games).should eq([game])
    end
  end

  describe "GET edit" do
    it "Edit" do
      game = Game.create! valid_attributes
      get :edit, {:id => game.to_param}
      assigns(:game).should eq(game)
    end
  end

  describe "POST create" do
    describe "Valid" do
      it "creates a new Game" do
        expect {
          post :create, {:game => valid_attributes}
        }.to change(Game, :count).by(1)
      end

      it "assigns a newly created game as @game" do
        post :create, {:game => valid_attributes}
        assigns(:game).should be_a(Game)
        assigns(:game).should be_persisted
      end

      it "redirects to the created game" do
        post :create, {:game => valid_attributes}
        response.should redirect_to(games_path)
      end
    end

    describe "Invalid" do
      it "assigns a newly created but unsaved game as @game" do
        Club.any_instance.stub(:save).and_return(false)
        post :create, {:game => { "club_ids" => "" }}
        assigns(:game).should be_a_new(Game)
      end

      it "re-renders the 'new' template" do
        Club.any_instance.stub(:save).and_return(false)
        post :create, {:game => { "club_ids" => "" }}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "Valid" do
      it "updates Game" do
        game = Game.create! valid_attributes
        Game.any_instance.should_receive(:update_attributes).with({ "kind" => "Premier League" })
        put :update, {:id => game.to_param, :game => { "kind" => "Premier League" }}
      end

      it "assigns the requested game as @game" do
        game = Game.create! valid_attributes
        put :update, {:id => game.to_param, :game => valid_attributes}
        assigns(:game).should eq(game)
      end

      it "redirects to the game" do
        game = Game.create! valid_attributes
        put :update, {:id => game.to_param, :game => valid_attributes}
        response.should redirect_to(games_path)
      end
    end

    describe "Invalid" do
      it "assigns the club as @club" do
        game = Game.create! valid_attributes
        Game.any_instance.stub(:save).and_return(false)
        put :update, {:id => game.to_param, :game => { "kind" => "" }}
        assigns(:game).should eq(game)
      end

      it "re-renders the 'edit' template" do
        game = Game.create! valid_attributes
        Game.any_instance.stub(:save).and_return(false)
        put :update, {:id => game.to_param, :game => { "kind" => "" }}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "Destroy" do
      game = Game.create! valid_attributes
      expect {
        delete :destroy, {:id => game.to_param}
      }.to change(Game, :count).by(-1)
    end
  end
end