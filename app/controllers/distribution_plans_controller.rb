class DistributionPlansController < ApplicationController
  layout "application"
  before_filter :load_user
  
  def index
  end
  
  def new
    @plan = DistributionPlan.new
  end
  
  def edit
    @plan = DistributionPlan.find(params[:id])
  end
  
  def show
    @plan = DistributionPlan.find(params[:id])
  end
  
  def create
    @plan = @user.distribution_plans.build
    if @plan.update_attributes(params[:distribution_plan])
      flash[:notice] = "Created template '#{@plan.name}'"
      redirect_to distribution_plans_path
    else
      render :action => "new"
    end
  end
  
  def update
    @plan = DistributionPlan.find(params[:id])
    @plan.user_id = @user.id
    if @plan.update_attributes(params[:distribution_plan])
      flash[:notice] = "Updated template '#{@plan.name}'"
      redirect_to distribution_plans_path
    else
      render :action => "edit"
    end
  end
  
  def destroy
    DistributionPlan.find(params[:id]).destroy
    flash.now[:notice] = "Deleted template '#{account_name}'"
    redirect_to distribution_plans_path
  end
  
end
