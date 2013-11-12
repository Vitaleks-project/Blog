require 'spec_helper'

describe PostsController do

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

  describe "DELETE destroy" do
    it "Destroy" do
      post = Post.create! valid_attributes
      expect {
        delete :destroy, {:id => post.to_param}
      }.to change(Post, :count).by(0)
    end
  end
end
