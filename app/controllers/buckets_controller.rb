class BucketsController < ApplicationController

  layout "no_side"
  before_filter :load_user
  
  def index
    @values = Hash.new
    @user.accounts.each do |account|
      @user.paychecks.each do |paycheck|
        account.regular_buckets.each do |bucket|
          pb = PaycheckToBucket.find(:first, :conditions => ["paycheck_id = ? and bucket_id = ?", paycheck.id, bucket.id])
          @values["#{account.id}-#{paycheck.id}-#{bucket.id}"] = pb.amount
        end
      end
    end
    flash[:notice] = "Updated Amounts"
  end
  
  def new
    @bucket = Bucket.new
  end
  
  def edit
    @bucket = Bucket.find(params[:id])
  end
  
  def show
    @bucket = Bucket.find(params[:id])
  end
  
  def create
    @bucket = Bucket.new(params[:bucket])
    if request.post? && @bucket.save
      flash[:notice] = "Created bucket '#{@bucket.name}'"
      redirect_to buckets_path
    else
      render :action => "new"
    end
  end
  
  def update
    @bucket = Bucket.find(params[:id])
    if @bucket.update_attributes(params[:bucket])
      flash[:notice] = "Updated bucket '#{@bucket.name}'"
      redirect_to buckets_path
    else
      render :action => "edit"
    end
  end
  
  def update_buckets
    @user.accounts.each do |account|
      @user.paychecks.each do |paycheck|
        account.regular_buckets.each do |bucket|
          parm = "#{account.id}-#{paycheck.id}-#{bucket.id}"
          amount = params[parm].gsub(/\$|\,/){''}
          PaycheckToBucket.update_amount(paycheck.id, bucket.id, amount)
        end
      end
    end
    flash[:notice] = "Updated Amounts"
    redirect_to :action => :index
  end
  
  def destroy
    Bucket.find(params[:id]).destroy
    flash.now[:notice] = "Deleted account '#{account_name}'"
    redirect_to buckets_path
  end

end
