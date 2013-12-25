require 'spec_helper'

describe Article do
  it { should belong_to(:admin) }
  it { should belong_to(:user) }

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:text) }

  describe "check logic approved/disapproved articles" do

    it 'Role Admin' do
      @admin = FactoryGirl.create(:admin)
      @article = FactoryGirl.create(:article, :admin => @admin, :approved => true)
      assert_equal 1, @admin.articles.size
      assert_equal 1, Article.approved.size
    end

    it 'Role User' do
      @user = FactoryGirl.create(:user)
      @article = FactoryGirl.create(:article, :user => @user, :approved => false)
      assert_equal 1, @user.articles.size
      assert_equal 1, Article.disapproved.size
    end
  end

end
