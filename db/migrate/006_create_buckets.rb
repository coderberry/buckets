class CreateBuckets < ActiveRecord::Migration
  def self.up
    create_table :buckets do |t|
      t.integer :category_id
      t.string :name
      t.decimal :balance, :precision => 8, :scale => 2, :default => 0
      t.integer :account_id
      t.string :bucket_type

      t.timestamps
    end
  end

  def self.down
    drop_table :buckets
  end
end
