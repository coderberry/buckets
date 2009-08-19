class Account < ActiveRecord::Base
  belongs_to :user
  has_many :ledgers
  has_many :buckets
  
  validates_presence_of :account_type, :balance, :institution, :name, :user_id
  validates_numericality_of :balance
  
  TYPES = ['Checking','Savings','Credit Card']
  
  def regular_buckets
    Bucket.find(:all, :conditions => ["bucket_type != ? and account_id = ?", "debt", self.id])
  end
  
  def debt_buckets
    Bucket.find(:all, :conditions => ["bucket_type = ? and account_id = ?", "debt", self.id])
  end
  
  private
  
  def validate
    if self.balance
      unless self.balance >= 0
        self.balance = 0
        errors.add("balance", "should be at least $0.00")
      end
    end
  end
  
end
