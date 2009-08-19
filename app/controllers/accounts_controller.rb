class AccountsController < ApplicationController

  layout "application"
  before_filter :load_user
  
  def index
  end
  
  def new
    @account = Account.new
  end
  
  def edit
    @account = Account.find(params[:id])
  end
  
  def show
    @account = Account.find(params[:id])
  end
  
  def create
    @account = Account.new(params[:account])
    @account.balance = params[:account][:balance].gsub(/\$|\,/){''}
    @account.user_id = @user.id
    if request.post? && @account.save
      flash[:notice] = "Created account '#{@account.name}'"
      redirect_to accounts_path
    else
      render :action => "new"
    end
  end
  
  def update
    @account = Account.find(params[:id])
    @account.account_type = params[:account][:account_type]
    @account.institution = params[:account][:institution]
    @account.name = params[:account][:name]
    @account.balance = params[:account][:balance].gsub(/\$|\,/){''}
    @account.user_id = @user.id
    if @account.save
      flash[:notice] = "Updated account '#{@account.name}'"
      redirect_to accounts_path
    else
      render :action => "edit"
    end
  end
  
  def destroy
    account = Account.find(params[:id])
    if account.user_id == @user.id
      account_name = account.name
      account.destroy
      flash.now[:notice] = "Deleted account '#{account_name}'"
      redirect_to accounts_path
    end
  end
  
end
