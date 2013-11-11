require 'spec_helper'

describe UsersController do

  def valid_attributes
    {
        name: "User1",
        email: "user@gmail.com",
        password: "12345678",
        password_confirmation: "12345678"
    }
  end

  describe 'GET Index' do
    it "Index" do
      user = User.create! valid_attributes
      get :index, {}
      assigns(:users).should eq([user])
    end
  end

  describe "GET show" do
    it "Show" do
      user = User.create! valid_attributes
      get :show, {:id => user.to_param}
      assigns(:user).should eq(user)
    end
  end

  describe "DELETE destroy" do
    it "Destroy" do
      user = User.create! valid_attributes
      expect {
        delete :destroy, {:id => user.to_param}
      }.to change(User, :count).by(-1)
    end
  end
end
