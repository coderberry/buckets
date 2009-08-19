class CreateAccounts < ActiveRecord::Migration
  def self.up
    create_table :accounts do |t|
      t.string :account_type
      t.decimal :balance, :precision => 8, :scale => 2, :default => 0
      t.string :institution
      t.string :name
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :accounts
  end
end
