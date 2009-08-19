class DistributionPlanDetail < ActiveRecord::Base
  belongs_to :distribution_plan
  has_one :bucket, :class_name => "Bucket", :foreign_key => "id"
  validates_presence_of :distribution_plan_id, :amount, :bucket_id
end
