require File.dirname(__FILE__) + '/../spec_helper'

describe Income do
  before(:each) do
    @income = Income.new
  end

  it "should be valid" do
    @income.should be_valid
  end
end
