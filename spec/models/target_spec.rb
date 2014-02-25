require 'spec_helper'

describe Target do
  it { should belong_to(:admin) }
  it { should belong_to(:answer) }
  it { should belong_to(:user) }
  it { should belong_to(:voting) }

  it { should validate_presence_of(:answer_id) }
end
