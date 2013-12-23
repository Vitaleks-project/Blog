require 'spec_helper'

describe News do
  it { should belong_to(:admin) }

  it { should validate_presence_of(:admin_id) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:url) }
end
