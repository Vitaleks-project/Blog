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

  it 'Impressions count' do
    article = FactoryGirl.create(:article)
    assert_equal 0, article.impression_count
  end

  it 'Log impression' do
    @article = FactoryGirl.create(:article)
    @user = FactoryGirl.create(:user)
    @admin = FactoryGirl.create(:admin)

    assert_equal [], @article.impressions

    @article.impressions.create(:ip_address => '127.0.0.1', :user_id => @user.id)
    assert_equal 1, @article.impressions.size

    @article.impressions.create(:ip_address => '127.0.0.1', :user_id => @admin.id)
    assert_equal 2, @article.impressions.size

    @article.impressions.create(:ip_address => '127.0.0.2', :user_id => nil)
    assert_equal 3, @article.impressions.size

    assert_equal 2, @article.unique_impression_count.size
  end

end
