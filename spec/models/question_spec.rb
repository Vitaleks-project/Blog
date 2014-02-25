require 'spec_helper'

describe Question do
  it { should belong_to(:voting) }
  it { should have_many(:answers) }

  it { should validate_presence_of(:content) }
  it { should validate_presence_of(:voting_id) }
end
