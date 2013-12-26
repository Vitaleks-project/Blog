require 'spec_helper'

describe Post do
  it { should belong_to(:admin) }
  it { should have_many(:comments) }
  it { should have_many(:impressions) }

  it { should validate_presence_of(:admin_id) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:text) }

  it 'Impressions count' do
    post = FactoryGirl.create(:post)
    assert_equal 0, post.impression_count
  end

  it 'Log impression' do
    @post = FactoryGirl.create(:post)
    @user = FactoryGirl.create(:user)
    @admin = FactoryGirl.create(:admin)

    assert_equal [], @post.impressions

    @post.impressions.create(:ip_address => '127.0.0.1', :user_id => @user.id)
    assert_equal 1, @post.impressions.size

    @post.impressions.create(:ip_address => '127.0.0.1', :user_id => @admin.id)
    assert_equal 2, @post.impressions.size

    @post.impressions.create(:ip_address => '127.0.0.2', :user_id => nil)
    assert_equal 3, @post.impressions.size

    assert_equal 2, @post.unique_impression_count.size
  end
end
