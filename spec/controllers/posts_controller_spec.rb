require 'spec_helper'

describe PostsController do

  before(:each) do
    sign_in(@user = FactoryGirl.create(:admin))
  end

  def valid_attributes
    {
        title: "First post",
        text: "Description desc",
        admin_id: 1
    }
  end

  describe 'GET Index' do
    it "Index" do
      post = Post.create! valid_attributes
      get :index, {}
      assigns(:posts).should eq([post])
    end
  end

  describe "GET Show" do
    it "Show" do
      post = Post.create! valid_attributes
      get :show, {:id => post.to_param}
      assigns(:post).should eq(post)
    end
  end

  describe "GET edit" do
    it "Edit" do
      post = FactoryGirl.create(:post)
      get :edit, {:id => post.to_param}
      assigns(:post).should eq(post)
    end
  end

  describe "POST create" do
    describe "valid" do
      it "creates a new Post" do
        expect {
          post :create, {:post => valid_attributes}
        }.to change(Post, :count).by(1)
      end

      it "assigns a newly created post as @post" do
        post :create, {:post => valid_attributes}
        assigns(:post).should be_a(Post)
        assigns(:post).should be_persisted
      end

      it "redirects to the created post" do
        post :create, {:post => valid_attributes}
        response.should redirect_to(posts_path)
      end
    end

    describe "Invalid" do
      it "assigns a newly created but unsaved post as @post" do
        Post.any_instance.stub(:save).and_return(false)
        post :create, {:post => { "title" => "" }}
        assigns(:post).should be_a_new(Post)
      end

      it "re-renders the 'new' template" do
        Post.any_instance.stub(:save).and_return(false)
        post :create, {:post => { "title" => "" }}
        response.should render_template("new")
      end
    end
  end

  describe "DELETE destroy" do
    it "Destroy" do
      post = Post.create! valid_attributes
      expect {
        delete :destroy, {:id => post.to_param}
      }.to change(Post, :count).by(-1)
    end
  end
end
