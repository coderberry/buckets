class PaycheckToAccount < ActiveRecord::Base
  validates_presence_of :account_id, :amount
  belongs_to :paycheck
  attr_accessor :should_destroy

  def should_destroy?
    should_destroy.to_i == 1
  end
  
end
