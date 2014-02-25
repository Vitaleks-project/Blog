require 'spec_helper'

describe VotingsController do

  before(:each) do
    sign_in(@user = FactoryGirl.create(:admin))
  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end
end
