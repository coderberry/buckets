class Ledger < ActiveRecord::Base
  belongs_to :account
  
  validates_presence_of :account_id, :amount, :cleared, :name, :date_of_transaction, :transaction_type
end
