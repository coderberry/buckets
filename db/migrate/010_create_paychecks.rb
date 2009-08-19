class CreatePaychecks < ActiveRecord::Migration
  def self.up
    create_table :paychecks do |t|
      t.integer :user_id
      t.string :name
      t.decimal :amount, :precision => 8, :scale => 2, :default => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :paychecks
  end
end
