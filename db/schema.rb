# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 12) do

  create_table "accounts", :force => true do |t|
    t.string   "account_type"
    t.decimal  "balance",      :precision => 8, :scale => 2, :default => 0.0
    t.string   "institution"
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "buckets", :force => true do |t|
    t.integer  "category_id"
    t.string   "name"
    t.decimal  "balance",     :precision => 8, :scale => 2, :default => 0.0
    t.integer  "account_id"
    t.string   "bucket_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "distribution_plan_details", :force => true do |t|
    t.integer  "distribution_plan_id"
    t.decimal  "amount",               :precision => 8, :scale => 2, :default => 0.0
    t.integer  "bucket_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "distribution_plans", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "incomes", :force => true do |t|
    t.integer  "user_id"
    t.date     "receive_date"
    t.decimal  "amount",       :precision => 8, :scale => 2, :default => 0.0
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ledger_to_buckets", :force => true do |t|
    t.decimal  "amount"
    t.integer  "bucket_id"
    t.integer  "ledger_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ledgers", :force => true do |t|
    t.integer  "account_id"
    t.decimal  "amount",              :precision => 8, :scale => 2, :default => 0.0
    t.boolean  "cleared",                                           :default => false
    t.string   "name"
    t.string   "ref"
    t.date     "date_of_transaction"
    t.string   "transaction_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "paycheck_to_accounts", :force => true do |t|
    t.integer  "account_id"
    t.integer  "paycheck_id"
    t.decimal  "amount",      :precision => 8, :scale => 2, :default => 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "paycheck_to_buckets", :force => true do |t|
    t.integer  "paycheck_id"
    t.integer  "bucket_id"
    t.integer  "amount",      :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "paychecks", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.decimal  "amount",     :precision => 8, :scale => 2, :default => 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "hashed_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
