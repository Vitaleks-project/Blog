require 'spec_helper'

describe Game do
  it { should belong_to(:admin) }
  it { should have_and_belong_to_many(:clubs) }

  it { should validate_presence_of(:admin_id) }
  it { should validate_presence_of(:location) }
  it { should validate_presence_of(:date) }
  it { should validate_presence_of(:kind) }

  describe 'validate for only two clubs for game' do
    it 'failed variants' do
      @club1 = FactoryGirl.create(:club)
      @club2 = FactoryGirl.create(:club)
      @club3 = FactoryGirl.create(:club)
      assert_raises(ActiveRecord::RecordNotSaved) { FactoryGirl.create(:game, :club_ids => [@club1.id]) }
      assert_raises(ActiveRecord::RecordNotSaved) { FactoryGirl.create(:game, :club_ids => [@club1.id, @club2.id, @club3.id]) }
    end

    it 'success variant' do
      @club1 = FactoryGirl.create(:club)
      @club2 = FactoryGirl.create(:club)
      FactoryGirl.create(:game, :club_ids => [@club1.id, @club2.id])
      assert_equal 1, Game.count
    end
  end
end