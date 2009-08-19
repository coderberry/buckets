require File.dirname(__FILE__) + '/../spec_helper'

describe LedgerToBucket do
  before(:each) do
    @ledger_to_bucket = LedgerToBucket.new
  end

  it "should be valid" do
    @ledger_to_bucket.should be_valid
  end
end
