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
end
