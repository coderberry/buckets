require File.dirname(__FILE__) + '/../spec_helper'

describe Ledger do
  before(:each) do
    @ledger = Ledger.new
  end

  it "should be valid" do
    @ledger.should be_valid
  end
end
