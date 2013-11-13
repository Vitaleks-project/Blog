require 'spec_helper'

describe Club do
  it { should belong_to(:admin) }
  it { should have_many(:players) }

  it { should validate_presence_of(:uniq_title) }
  it { should validate_uniqueness_of(:uniq_title) }
  it { should validate_presence_of(:coach) }
  it { should validate_presence_of(:admin_id) }
  it { should validate_presence_of(:year_of_foundation) }
  it { should validate_presence_of(:clubname) }
end
