require 'spec_helper'

describe Admin do
  it { should have_many(:posts) }
  it { should have_many(:clubs) }
  it { should have_many(:players) }
  it { should have_many(:comments) }

end
