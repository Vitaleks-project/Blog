require 'spec_helper'

describe Answer do
  it { should belong_to(:question) }
  it { should have_many(:targets) }

  it { should validate_presence_of(:content) }
  it { should validate_presence_of(:question_id) }
end
