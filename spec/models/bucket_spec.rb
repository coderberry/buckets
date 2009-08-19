require File.dirname(__FILE__) + '/../spec_helper'

describe Bucket do
  before(:each) do
    @bucket = Bucket.new
  end

  it "should be valid" do
    @bucket.should be_valid
  end
end
