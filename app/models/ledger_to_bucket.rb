class LedgerToBucket < ActiveRecord::Base
  validates_presence_of :ledger_id, :bucket_id
end
