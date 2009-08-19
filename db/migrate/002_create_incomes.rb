class CreateIncomes < ActiveRecord::Migration
  def self.up
    create_table :incomes do |t|
      t.integer :user_id
      t.date :receive_date
      t.decimal :amount, :precision => 8, :scale => 2, :default => 0
      t.string :description
      
      t.timestamps
    end
  end

  def self.down
    drop_table :incomes
  end
end
