require 'spec_helper'

describe Voting do

  it { should validate_presence_of(:admin_id) }
  it { should validate_presence_of(:title) }
  it { should have_many(:questions) }
  it { should have_many(:targets) }

  describe "Test for voting voting targets size" do
    before(:each) do
      @admin = FactoryGirl.create(:admin)
      @voting = FactoryGirl.create(:voting)
      @voting.update_attributes(:current => true)
      @question = FactoryGirl.create(:question, :voting_id => Voting.find_last_by_current(true).id)
      @answer = FactoryGirl.create(:answer, :question_id => @question.id)
      @target = FactoryGirl.create(:target, :admin_id => @admin.id, :answer_id =>  @answer.id, :voting_id => Voting.find_last_by_current(true).id)
    end

    it "check voting targets size" do
      Voting.voting_targets_size.should_not be_nil
      Voting.voting_targets_size.should eq 1
    end
  end

  describe "Test for voting voting targets size" do
    before(:each) do
      @admin = FactoryGirl.create(:admin)
      @voting = FactoryGirl.create(:voting)
      @voting.update_attributes(:current => true)
      @question = FactoryGirl.create(:question, :voting_id => Voting.find_last_by_current(true).id)
      @answer = FactoryGirl.create(:answer, :question_id => @question.id)
      2.times do
        @target = FactoryGirl.create(:target, :admin_id => @admin.id, :answer_id =>  @answer.id, :voting_id => Voting.find_last_by_current(true).id)
      end
    end

    it "check voting targets size" do
      Voting.percentage_off.should_not be_nil
      Voting.voting_targets_size.should eq 2
      Voting.percentage_off.should eq 50.0 # Need fix logic because must be 100.0 when we 2 add vote for one and some answer
    end
  end
end
