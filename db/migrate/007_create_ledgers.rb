class CreateLedgers < ActiveRecord::Migration
  def self.up
    create_table :ledgers do |t|
      t.integer :account_id
      t.decimal :amount, :precision => 8, :scale => 2, :default => 0
      t.boolean :cleared, :default => false
      t.string :name
      t.string :ref
      t.date :date_of_transaction
      t.string :transaction_type
      
      t.timestamps
    end
  end

  def self.down
    drop_table :ledgers
  end
end
