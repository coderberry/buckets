class WelcomeController < ApplicationController
  
  def index
  end
  
  def login
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to :controller => "dashboard"
    else
      flash.now[:notice] = "Invalid email/password combination"
      render :action => "index"
    end
  end
  
  def logout
    session[:user_id] = nil
    redirect_to :action => "index"
  end
  
end
