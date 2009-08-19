require File.dirname(__FILE__) + '/../spec_helper'

describe DistributionPlan do
  before(:each) do
    @distribution_plan = DistributionPlan.new
  end

  it "should be valid" do
    @distribution_plan.should be_valid
  end
end
