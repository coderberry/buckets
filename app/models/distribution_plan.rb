class DistributionPlan < ActiveRecord::Base
  belongs_to :user
  has_many :distribution_plan_details
  validates_presence_of :name, :user_id
  
  def amount
    total_amount = 0
    self.distribution_plan_details.each do |detail|
      total_amount += detail.amount
    end
    total_amount
  end
  
  def detail_attributes=(detail_attributes)
    detail_attributes.each do |key, value|
      p = DistributionPlanDetail.find_by_id(key) || DistributionPlanDetail.new
      p.distribution_plan_id = self.id
      p.amount = value["amount"].gsub(/\$|\,/){''}
      p.bucket_id = value["bucket_id"].to_i
      p.save
    end
  end
  
end
