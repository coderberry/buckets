class User < ActiveRecord::Base
  
  has_many :paychecks
  has_many :accounts
  has_many :categories
  has_many :distribution_plans
  has_many :incomes
  has_many :ledgers, :through => :accounts
  has_many :distribution_plan_details, :through => :distribution_plans
  
  validates_presence_of :username, :message => 'is required'
  validates_presence_of :email, :message => 'is required'
  validates_presence_of :first_name, :last_name, :hashed_password, :salt
  validates_uniqueness_of :username, :email
  
  attr_accessor :password_confirmation
  validates_confirmation_of :password
  
  def validate
    errors.add_to_base("Missing password") if hashed_password.blank?
  end
  
  # 'password' is a virtual attribute
  def password
    @password
  end
  
  def password=(pwd)
    @password = pwd
    return if pwd.blank?
    create_new_salt
    self.hashed_password = User.encrypted_password(self.password, self.salt)
  end
  
  def self.authenticate(email, password)
    user = self.find_by_email(email)
    if user
      expected_password = encrypted_password(password, user.salt)
      if user.hashed_password != expected_password
        user = nil
      end
    end
    user
  end
  
  def full_name
    "#{self.first_name} #{self.last_name}"
  end
  
  def buckets
    account_ids = []
    Account.find(:all, :conditions => ["user_id = ?", self.id]).each do |acc|
      account_ids << acc.id.to_i
    end
    Bucket.find_by_sql("SELECT * FROM buckets WHERE account_id IN (#{account_ids.join(',')})")
  end
  
  private
  
  def self.encrypted_password(password, salt)
    string_to_hash = password + "berry" + salt # 'berry' makes it harder to guess
    Digest::SHA1.hexdigest(string_to_hash)
  end
  
  def create_new_salt
    self.salt = self.object_id.to_s + rand.to_s
  end
  
  def after_destroy
    if User.count.zero?
      raise "Can't delete last user"
    end
  end
  
end
