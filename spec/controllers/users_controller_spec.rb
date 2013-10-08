require 'spec_helper'

describe UsersController do
  login_user

  describe "Post" do
    it "index" do
      get 'index'
      response.should be_success
    end
  end
end
