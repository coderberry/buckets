class PaychecksController < ApplicationController

  layout "application"
  before_filter :load_user
  
  def index
  end
  
  def new
    @paycheck = Paycheck.new
    1.times { @paycheck.paycheck_to_accounts.build }
  end
  
  def create
    parms = params[:paycheck]
    parms[:amount] = parms[:amount].gsub(/\$|\,/){''}
    parms[:user_id] = @user.id
    @paycheck = Paycheck.new(parms)
    if @paycheck.save
      flash[:notice] = "Created paycheck '#{@paycheck.name}'"
      redirect_to paychecks_path
    else
      render :action => "new"
    end
  end
  
  def edit
    @paycheck = Paycheck.find(params[:id])
  end
  
  def update
    @paycheck = Paycheck.find(params[:id])
    @paycheck.amount = params[:paycheck][:amount].gsub(/\$|\,/){''}
    @paycheck.name = params[:paycheck][:name]
    @paycheck.paycheck_to_account_attributes = params[:paycheck][:paycheck_to_account_attributes]
    if @paycheck.save
      flash[:notice] = "Updated account '#{@paycheck.name}'"
      redirect_to paychecks_path
    else
      render :action => "edit"
    end
  end
  
  def destroy
    paycheck = Paycheck.find(params[:id])
    if paycheck.user_id == @user.id
      paycheck_name = paycheck.name
      paycheck.destroy
      flash.now[:notice] = "Deleted paycheck '#{paycheck_name}'"
      redirect_to paychecks_path
    end
  end
  
end
