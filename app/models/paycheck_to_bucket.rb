class PaycheckToBucket < ActiveRecord::Base
  
  def self.update_amount(paycheck_id, bucket_id, amount)
    p = PaycheckToBucket.find(:first, :conditions => ["paycheck_id = ? and bucket_id = ?", paycheck_id, bucket_id]) || PaycheckToBucket.new(:paycheck_id => paycheck_id, :bucket_id => bucket_id)
    p.amount = amount
    p.save
  end
  
end
