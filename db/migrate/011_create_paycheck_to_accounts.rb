class CreatePaycheckToAccounts < ActiveRecord::Migration
  def self.up
    create_table :paycheck_to_accounts do |t|
      t.integer :account_id
      t.integer :paycheck_id
      t.decimal :amount, :precision => 8, :scale => 2, :default => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :paycheck_to_accounts
  end
end
