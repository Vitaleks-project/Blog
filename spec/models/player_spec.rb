require 'spec_helper'

describe Player do
  it { should belong_to(:club) }
  it { should belong_to(:admin) }

  it { should validate_presence_of(:club_id) }

  it "full name" do
    club = FactoryGirl.create(:club)
    player = FactoryGirl.create(:player, :first_name => 'Ronaldo', :last_name => '', :club => club)
    assert_equal player.full_name, 'Ronaldo '
  end

end
