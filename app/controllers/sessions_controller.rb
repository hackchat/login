class SessionsController < ApplicationController
  def new
  end

  def create
    user = login(params[:email], params[:password], params[:remember_me])
    if user
      redirect_back_or_to login_path, :notice => t(:logged_in)
    else
      flash[:alert] = t(:invalid)
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_url, :notice => t(:logged_out)
  end
end