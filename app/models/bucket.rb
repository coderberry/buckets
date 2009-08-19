class Bucket < ActiveRecord::Base
  belongs_to :account
  validates_presence_of :category_id, :name, :balance, :bucket_type, :account_id
  
  def monthly_amount
    total_amount = 0
    total_amount
  end
  
  def paychecks
    PaycheckToAccount.find(:all, :conditions => ["bucket_id = ?", self.id])
  end
  
end
