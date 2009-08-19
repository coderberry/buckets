class Paycheck < ActiveRecord::Base
  validates_presence_of :name, :amount, :user_id
  has_many :paycheck_to_accounts
  after_create :save_paycheck_to_accounts
  after_update :save_paycheck_to_accounts
  validates_associated :paycheck_to_accounts
  
  def paycheck_to_account_attributes=(paycheck_to_account_attributes)
    paycheck_to_account_attributes.each do |attributes|
      attributes[:amount] = attributes[:amount].gsub(/\$|\,/){''}
      if attributes[:id].blank?
        paycheck_to_accounts.build(attributes)
      else
        paycheck_to_account = paycheck_to_accounts.detect { |t| t.id == attributes[:id].to_i }
        paycheck_to_account.attributes = attributes
      end
    end
  end

  def save_paycheck_to_accounts
    paycheck_to_accounts.each do |t|
      if t.should_destroy?
        t.destroy
      else
        t.paycheck_id = self.id
        t.save(false)
      end
    end
  end
  
  def remaining_amount
    items = PaycheckToAccount.find(:all, :conditions => ["paycheck_id = ?", self.id])
    sum = 0.0
    items.each do |item|
      sum += item.amount
    end
    sum
  end
  
end