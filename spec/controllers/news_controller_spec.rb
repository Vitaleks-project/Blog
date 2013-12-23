require 'spec_helper'

describe NewsController do

  before(:each) do
    sign_in(@user = FactoryGirl.create(:admin))
  end

  def valid_attributes
    {
        title: "My first news",
        url: "http://football.ua/",
        admin_id: 1
    }
  end

  describe "GET index" do
    it "Index" do
      news = News.create! valid_attributes
      get :index, {}
      assigns(:news).should eq([news])
    end
  end

  describe "DELETE destroy" do
    it "Destroy" do
      news = News.create! valid_attributes
      expect {
        delete :destroy, {:id => news.to_param}
      }.to change(News, :count).by(-1)
    end
  end
end
