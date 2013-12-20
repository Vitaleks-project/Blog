require 'spec_helper'

describe Injured do
  it { should belong_to(:admin) }

  it { should validate_presence_of(:date_and) }
  it { should validate_presence_of(:player_name) }
  it { should validate_presence_of(:injurious) }

end
