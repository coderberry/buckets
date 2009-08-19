require File.dirname(__FILE__) + '/../spec_helper'

describe DistributionPlanDetail do
  before(:each) do
    @distribution_plan_detail = DistributionPlanDetail.new
  end

  it "should be valid" do
    @distribution_plan_detail.should be_valid
  end
end
