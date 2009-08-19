class CreateDistributionPlanDetails < ActiveRecord::Migration
  def self.up
    create_table :distribution_plan_details do |t|
      t.integer :distribution_plan_id
      t.decimal :amount, :precision => 8, :scale => 2, :default => 0
      t.integer :bucket_id
      
      t.timestamps
    end
  end

  def self.down
    drop_table :distribution_plan_details
  end
end
