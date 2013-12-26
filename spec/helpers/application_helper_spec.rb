require 'spec_helper'

describe ApplicationHelper do

  describe 'Check how admin can banned user' do

    it 'banned (false)' do
      @user = FactoryGirl.create(:user)
      @user.banned.should be(false)
    end

    it 'banned (true)' do
      @user = FactoryGirl.create(:user)
      @user.update_attributes(:banned => true)
      @user.banned.should be(true)
    end
  end

end