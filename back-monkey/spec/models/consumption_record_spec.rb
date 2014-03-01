require 'spec_helper'

describe ConsumptionRecord do
  it { should belong_to :user }
end