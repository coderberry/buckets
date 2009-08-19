class CreateLedgerToBuckets < ActiveRecord::Migration
  def self.up
    create_table :ledger_to_buckets do |t|
      t.decimal :amount
      t.integer :bucket_id
      t.integer :ledger_id

      t.timestamps
    end
  end

  def self.down
    drop_table :ledger_to_buckets
  end
end
