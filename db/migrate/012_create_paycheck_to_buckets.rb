class CreatePaycheckToBuckets < ActiveRecord::Migration
  def self.up
    create_table :paycheck_to_buckets do |t|
      t.integer :paycheck_id
      t.integer :bucket_id
      t.integer :amount, :precision => 8, :scale => 2, :default => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :paycheck_to_buckets
  end
end
